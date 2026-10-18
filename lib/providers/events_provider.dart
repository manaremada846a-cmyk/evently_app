import 'dart:async';

import 'package:evently_app/model/event_card_model.dart';
 
import 'package:evently_app/services/event_services.dart';
import 'package:flutter/material.dart';

class EventsProvider extends ChangeNotifier {
  EventsProvider({EventService? service})
    : _service = service ?? EventService();

  final EventService _service;
  StreamSubscription<List<EventCardModel>>? _sub;

  List<EventCardModel> _events = [];
  bool isLoading = true;

  List<EventCardModel> get events => _events;

  // الكاتيجوري المختارة في الـ Home ('All' = من غير فلتر)
  String selectedCategory = 'All';

  List<EventCardModel> get filteredEvents => selectedCategory == 'All'
      ? _events
      : _events.where((e) => e.category == selectedCategory).toList();

  void changeCategory(String category) {
    if (category == selectedCategory) return;
    selectedCategory = category;
    notifyListeners();
  }

  List<EventCardModel> get favorites =>
      _events.where((e) => e.isFav).toList();

  /// بتتنادى من TabsScreen. بتسمع لتغييرات Firestore لحظيًا
  void startListening() {
    _sub?.cancel();
    if (!_service.isLoggedIn) return;

    isLoading = true;
    _sub = _service.getEvents().listen(
      (events) {
        _events = events;
        isLoading = false;
        notifyListeners();
      },
      onError: (_) {
        isLoading = false;
        notifyListeners();
      },
    );
  }

  Future<void> addEvent(EventCardModel event) => _service.addEvent(event);

  Future<void> toggleFav(EventCardModel event) =>
      _service.setFavorite(event.id, !event.isFav);

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}