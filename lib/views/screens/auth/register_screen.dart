import 'package:evently_app/gen/assets.gen.dart';
import 'package:evently_app/model/user_model.dart';
 import 'package:evently_app/services/firebase_auth_service.dart';
import 'package:evently_app/theme/app_color.dart';
import 'package:evently_app/common/widgets/custom_login_text_filed.dart';
import 'package:evently_app/views/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String appRoute = "registerScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
   
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
                    padding: const EdgeInsets.only(top: 30.0, bottom: 15),
                    child: Text(
                      "Create your account",
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(color: Theme.of(context).hoverColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CustomLoginTextFiled(
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return "name is requirded";
                        } else {
                          return null;
                        }
                      },
                      isPassword: false,
                      context: context,
                      controller: namecontroller,
                      label: "Enter your name",
                      prefix: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(Assets.images.user),
                      ),
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
                      controller: emailcontroller,
                      label: "Enter your email",
                      prefix: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(Assets.images.sms),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CustomLoginTextFiled(
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return " password is requirded";
                        }
                        if (p0.length < 8) {
                          return "password must be at least 8";
                        } else {
                          passwordController.text = p0;
                          return null;
                        }
                      },
                      isPassword: true,
                      context: context,
                      controller: passwordController,
                      label: "Enter your password",
                      prefix: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(Assets.images.lock),
                      ),
                    ),
                  ),

                  CustomLoginTextFiled(
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return " confirm is requirded";
                      }
                      if (p0 != passwordController.text) {
                        return "wrong";
                      } else {
                        return null;
                      }
                    },
                    isPassword: true,
                    context: context,
                    controller: confirmPasswordController,
                    label: "Confirm your password",
                    prefix: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(Assets.images.lock),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          bool isValid = _globalKey.currentState!.validate();
                          if (isValid) {
  final registerModal = UserModel(
    name: namecontroller.text.trim(),
    rePassword: confirmPasswordController.text,
    email: emailcontroller.text,
    password: passwordController.text,
  );

  try {
    await FirebaseAuthService.register(registerModal);

    if (!context.mounted) return;

    Navigator.pushReplacementNamed(
      context,
      HomeScreen.appRoute,
    );
  } on FirebaseAuthException catch (e) {
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(e.message ?? "Registration failed"),
      ),
    );
  }

                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                          ),
                        ),
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: AppColors.whiteText,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 10,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account?",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(fontSize: 16),
                          ),
                          TextSpan(
                            text: "Login",
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Theme.of(context)
                                      .primaryColor,
                                  decorationThickness: 2,
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(context);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    spacing: 20,
                    mainAxisAlignment: .center,
                    children: [
                      Expanded(
                        child: Divider(color: Theme.of(context).focusColor),
                      ),
                      Text(
                        "Or",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Theme.of(context).focusColor),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).cardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                          ),
                        ),
                        child: Row(
                          spacing: 15,
                          mainAxisAlignment: .center,
                          children: [
                            Image.asset(
                              Assets.images.google.path,
                              width: 26,
                              height: 26,
                            ),
                            Text(
                              "Sign up with Google",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
