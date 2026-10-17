import 'package:flutter/material.dart';
class ThemeProvider extends ChangeNotifier{
ThemeMode themeMode=ThemeMode.light;
bool get isDark=>themeMode==ThemeMode.dark;
void changTheme(ThemeMode mode){
if(mode==themeMode)return;
themeMode =mode;
notifyListeners();
}
}