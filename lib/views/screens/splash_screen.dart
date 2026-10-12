import 'package:evently_app/gen/assets.gen.dart';
import 'package:evently_app/views/screens/onBording_screen.dart';
 import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String appRoute = "splashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
     super.initState();
    _goNext();
   
  }

  Future<void> _goNext() async {
    await Future.delayed(Duration(seconds: 3));
    if (!mounted) return;
    //TODO check shered preference if onbording seen
    Navigator.pushReplacementNamed(context, OnBordingScreen.appRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         Spacer(),
          Image.asset(Assets.images.splashImag2.path),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Column(
              spacing: 20,
              children: [
                Image.asset(Assets.images.routeLog01.path),
                Text(
                  "Supervised by Mohamed Nabil",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).splashColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
