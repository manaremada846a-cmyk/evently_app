import 'package:evently_app/firebase_options.dart';
import 'package:evently_app/theme/app_theme.dart';
import 'package:evently_app/views/screens/auth/forget_password.dart';
import 'package:evently_app/views/screens/auth/login_screen.dart';
import 'package:evently_app/views/screens/auth/register_screen.dart';
import 'package:evently_app/views/screens/onBording_screen.dart'; 
import 'package:evently_app/views/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
 
void main()async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
bool isLoading(){
  return  FirebaseAuth.instance.currentUser == null?false:true;

}
  @override
  Widget build(Object context) {
   return MaterialApp( 
     theme: AppTheme.lightTheme,
    debugShowCheckedModeBanner: false,
    routes: {
      LoginScreen.appRoute:(context) => LoginScreen(),
     RegisterScreen.appRoute :(context) =>RegisterScreen(),
     ForgetPassword.appRoute:(context) => ForgetPassword(),
       OnBordingScreen.appRoute:(context) => OnBordingScreen(),
        HomeScreen.appRoute:(context) => HomeScreen(),
    },
    home:isLoading()? HomeScreen(): LoginScreen(),
   );
    
  }

 
}
