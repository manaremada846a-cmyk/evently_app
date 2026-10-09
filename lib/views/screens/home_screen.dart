 import 'package:evently_app/common/widgets/custom_home_header.dart';
import 'package:flutter/material.dart';
 
class HomeScreen extends StatelessWidget {
  const new({super.key});
  static String appRoute="HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
 Column(
   children: [
     CustomHomeHeader(),
   ],
 ),



    );
  }
}