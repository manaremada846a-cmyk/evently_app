  import 'package:evently_app/gen/assets.gen.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBordingScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
   late Size size =MediaQuery.sizeOf(context);
  @override
  Widget build(BuildContext context) {
   
     return Scaffold(
  
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(spacing: 15,
              children: [
               
SvgPicture.asset(Assets.images.eventlyImage)   ,

        
         ],),
          ),
        ),),
    );
  }
}