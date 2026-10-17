import 'package:evently_app/model/event_card_model.dart';
import 'package:flutter/material.dart';

class EventsProvider extends ChangeNotifier {
  final List<EventCardModel> _events = [];

  List<EventCardModel> get events => List.unmodifiable(_events);

  List<EventCardModel> get favorites =>
      _events.where((e) => e.isFav).toList();

  void addEvent(EventCardModel event) {
    _events.insert(0, event); // الأحدث يظهر فوق
    notifyListeners();
  }

  void toggleFav(EventCardModel event) {
    event.isFav = !event.isFav;
    notifyListeners();
  }
}