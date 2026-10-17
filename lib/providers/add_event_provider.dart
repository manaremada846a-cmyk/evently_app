import 'package:flutter/material.dart';

class AddEventProvider extends ChangeNotifier {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String selectedCategory = 'Sport';

  void changeCategory(String value) {
    selectedCategory = value;
    notifyListeners();
  }

  void changeDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void changeTime(TimeOfDay time) {
    selectedTime = time;
    notifyListeners();
  }

  /// بترجع رسالة الخطأ لو في حاجة ناقصة، أو null لو كله تمام
  String? validate() {
    if (titleController.text.trim().isEmpty) return 'Please enter a title';
    if (descController.text.trim().isEmpty) return 'Please enter a description';
    if (selectedDate == null) return 'Please choose a date';
    if (selectedTime == null) return 'Please choose a time';
    return null;
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }
}