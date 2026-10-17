 
import 'package:evently_app/common/theme/app_color.dart';
import 'package:evently_app/common/widgets/custom_page1.dart';
import 'package:evently_app/model/onBording_model.dart';
import 'package:evently_app/common/widgets/custom_onbording_page.dart';
import 'package:evently_app/gen/assets.gen.dart';
 
import 'package:evently_app/views/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});
  static const String appRoute = "onbordingScreen";

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  List<OnboardingModel> boarding = OnboardingModel.items;
  int index = 0;
  PageController? controller = PageController();
  @override
void dispose() {
  controller?.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [index !=0&&index!=1?
                Padding(
                  padding: const EdgeInsets.only(right: 70),
                  child: SizedBox(
                            width: 30,
                            height: 30,
                            child: IconButton(
                              style:IconButton.styleFrom(
                                padding: EdgeInsets.only(left: 8),
                                backgroundColor: theme.cardColor,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: theme.focusColor),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              onPressed: () {
                              controller!.previousPage(duration:Duration(milliseconds: 300), curve: Curves.easeInOut);
                              },
                               icon: Icon(Icons.arrow_back_ios, color: theme.hoverColor,size: 20,) ,
                              
                            ),
                          ),
                ):
                  Spacer(),
                  Image.asset(
                    Assets.images.evently.path,
                    color: theme.primaryColor,
                  ),
                  Spacer(),
                  (index != 0 && index != 3)
                      ? SizedBox(
                          width: 60,
                          height: 30,
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: theme.cardColor,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: theme.focusColor),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                             controller!.animateToPage(boarding.length, duration:Duration(milliseconds: 300), curve: 
                             Curves.easeInOut);
                            },
                            child: Text(
                              "skip",
                              style: theme.textTheme.headlineMedium!.copyWith(
                                fontSize: 14,
                                color: theme.hoverColor,
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  index = value;
                  setState(() {});
                },
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return CustomPage1 ();
                  }
                  return CustomOnbordingPage(
                    controler: controller!,
                    onboardingModel: boarding[index - 1],
                  );
                },
                itemCount: boarding.length + 1,
              ),
            ),

            SizedBox(
              width: 350,
              height: 50,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: theme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
                onPressed: () {
                  if (index < boarding.length) {
                    controller!.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.pushReplacementNamed(
                      context,
                      LoginScreen.appRoute,
                    );
                  }
                },
                child: Text(
                  index == 0
                      ? "Let’s start"
                      : index == 3
                      ? "Get started"
                      : "Next",
                  style: theme.textTheme.headlineMedium!.copyWith(
                    fontSize: 20,
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
 