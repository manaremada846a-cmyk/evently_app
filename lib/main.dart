import 'package:evently_app/screens/onbording_Screen.dart';
import 'package:evently_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(Object context) {
   return MaterialApp(  theme: AppTheme.lightTheme,
    debugShowCheckedModeBanner: false,
    
    home: OnBordingScreen(),
   );
    
  }

 
}
