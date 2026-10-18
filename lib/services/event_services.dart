import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/model/event_card_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// كل كلام Firestore الخاص بالإيفنتات في مكان واحد.
/// المسار: users/{uid}/events/{eventId}
class EventService {
  EventService({FirebaseFirestore? firestore, FirebaseAuth? auth})
    : _db = firestore ?? FirebaseFirestore.instance,
      _auth = auth ?? FirebaseAuth.instance;

  final FirebaseFirestore _db;
  final FirebaseAuth _auth;

  bool get isLoggedIn => _auth.currentUser != null;

  CollectionReference<Map<String, dynamic>> get _col {
    final uid = _auth.currentUser?.uid;
    if (uid == null) throw Exception('You must be logged in');
    return _db.collection('users').doc(uid).collection('events');
  }

  /// ستريم بإيفنتات اليوزر الحالي، مرتبة بتاريخ الإيفنت
  Stream<List<EventCardModel>> getEvents() {
    return _col
        .orderBy('dateTime')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => EventCardModel.fromJson(doc.id, doc.data()))
              .toList(),
        );
  }

  Future<void> addEvent(EventCardModel event) async {
    await _col.add(event.toJson());
  }

  Future<void> setFavorite(String eventId, bool isFav) async {
    await _col.doc(eventId).update({'isFav': isFav});
  }
}