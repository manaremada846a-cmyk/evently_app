import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/common/category_images.dart';

class EventCardModel {
  final String id;
  final String title;
  final String description;
  final String category;
  final DateTime dateTime;
  final bool isFav;

  const EventCardModel({
    this.id = '',
    required this.title,
    required this.description,
    required this.category,
    required this.dateTime,
    this.isFav = false,
  });

  // الصور بتتحسب من الكاتيجوري، فمش بنخزنها في Firestore
  String get getImageunder => CategoryImages.of(category).under;
  String get getImage => CategoryImages.of(category).main;

  static const _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  String get date => '${dateTime.day} ${_months[dateTime.month - 1]}';

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'category': category,
    'dateTime': Timestamp.fromDate(dateTime),
    'isFav': isFav,
  };

  factory EventCardModel.fromJson(String id, Map<String, dynamic> json) {
    return EventCardModel(
      id: id,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? 'Sport',
      dateTime: (json['dateTime'] as Timestamp).toDate(),
      isFav: json['isFav'] ?? false,
    );
  }
}