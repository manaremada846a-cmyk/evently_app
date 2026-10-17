import 'package:evently_app/firebase_options.dart';
import 'package:evently_app/common/theme/app_theme.dart';
import 'package:evently_app/providers/add_event_provider.dart';
import 'package:evently_app/providers/events_provider.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:evently_app/views/screens/auth/forget_password.dart';
import 'package:evently_app/views/screens/auth/login_screen.dart';
import 'package:evently_app/views/screens/auth/register_screen.dart';
import 'package:evently_app/views/screens/event_screen.dart';
import 'package:evently_app/views/screens/onBording_screen.dart';
import 'package:evently_app/views/screens/tabs_screen.dart';
import 'package:evently_app/views/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
void main()async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp 
 ( MultiProvider(providers: [
   ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => EventsProvider()),
 ],
 child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
bool isLoading(){
  return  FirebaseAuth.instance.currentUser == null?false:true;
 
}
  @override
  
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    
   return MaterialApp( 
     theme: AppTheme.lightTheme,
  darkTheme: AppTheme.darkTheme,
  themeMode: themeProvider.themeMode,
    debugShowCheckedModeBanner: false,
    routes: {//EventScreen
      SplashScreen.appRoute:(context) => SplashScreen(),
      LoginScreen.appRoute:(context) => LoginScreen(),
     RegisterScreen.appRoute :(context) =>RegisterScreen(),
     ForgetPassword.appRoute:(context) => ForgetPassword(),
       OnBordingScreen.appRoute:(context) => OnBordingScreen(),
       TabsScreen.appRoute:(context) =>  TabsScreen(),
      EventScreen .appRoute:(context) => ChangeNotifierProvider(create: (BuildContext context) { return AddEventProvider(); },
      child: EventScreen()),
    },initialRoute:SplashScreen.appRoute ,
  // home:isLoading()? HomeScreen(): LoginScreen(),
   //TODO
   );
    
  }

 
}
