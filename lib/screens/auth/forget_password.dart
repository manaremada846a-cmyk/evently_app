import 'package:evently_app/gen/assets.gen.dart';
import 'package:evently_app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});
  static String appRoute = "ForgetPasssword";
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forget Password")),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(spacing: 60,
          children: [
 SvgPicture.asset(Assets.images.group),
SizedBox(width: double.infinity,
height: 50,
  child: ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(18)),
                            ),
                          ),
                          child: Text(
                            "Reset password",
                            style: TextStyle(
                              color: AppColors.whiteText,
                             
                            ),
                          ),
                        ),
),
            
            ],
        ),
      ),
    );
  }
}
