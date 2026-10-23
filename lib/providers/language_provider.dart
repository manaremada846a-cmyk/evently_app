import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  bool get isArabic => _locale.languageCode == 'ar';

  void changeLanguage() {
    if (isArabic) {
      _locale = const Locale('en');
    } else {
      _locale = const Locale('ar');
    }

    notifyListeners();
  }
}