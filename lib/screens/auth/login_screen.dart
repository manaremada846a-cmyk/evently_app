import 'package:evently_app/gen/assets.gen.dart';
import 'package:evently_app/theme/app_color.dart';
 import 'package:evently_app/views/custom_login_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String appRoute = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _globalKey,
            child: SingleChildScrollView(
              child: Column(
                spacing: 10,
                crossAxisAlignment: .start,
              
                children: [
                  Center(child: Image.asset(Assets.images.evently.path)),
              
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0,bottom: 15),
                    child: Text(
                      "Login to your account",
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(color: Theme.of(context).hoverColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CustomLoginTextFiled(
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return "email is requirded";
                        } else {
                          return null;
                        }
                      },
                      isPassword: false,
                      context: context,
                      label: "Enter your email",
                      prefix: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(Assets.images.sms),
                      ),
                    ),
                  ),
                  CustomLoginTextFiled(
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return " password is requirded";
                      }
                      if (p0.length > 8) {
                        return "password must be at least 8";
                      } else {
                        return null;
                      }
                    },
                    isPassword: true,
                    context: context,
                    label: "Enter your password",
                    prefix: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(Assets.images.lock),
                    ),
                  ),
              
                  Row(
                    mainAxisAlignment: .end,
                    children: [
                      Text(
                        "Forget Password?",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.underline,
                          decorationColor: Theme.of(context).primaryColor,
                          decorationThickness: 2,
                        ), //Don’t have an account ? Signup
                      ),
                    ],
                  ),
              
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          bool isValid = _globalKey.currentState!.validate();
                          if (isValid) {
                            //navigation
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                          ),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: AppColors.whiteText,
                           
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                    child: Row(
                      spacing: 0,
                      children: [
                        Text(
                          "Don’t have an account ?",
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(fontSize: 16),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Signup",
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Theme.of(context).primaryColor,
                                  decorationThickness: 2,
                                ),
                          ),
                        ),
                        
                      ],
                    ),
                  ), Row(
                     mainAxisAlignment: .center,
                      children: [
                        Text(
                          "Or",
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(fontSize: 18,fontWeight: FontWeight.w500,color: Theme.of(context).primaryColor)
                              
                        )]),
                
                   Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).cardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                          ),
                        ),
                        child: Row(spacing: 15,
                        mainAxisAlignment: .center,
                          children: [
                            Image.asset(Assets.images.google.path,width: 26,height: 26,),
                            Text(
                              "Login with Google",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                               fontSize: 18
                                 
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
