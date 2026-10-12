import 'package:evently_app/model/onBording_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomOnbordingPage extends StatelessWidget {
  const CustomOnbordingPage({
    super.key,
    required this.onboardingModel,
    required this.controler,
  });

  final OnboardingModel onboardingModel;
  final PageController controler;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Image.asset(
                onboardingModel.imageUrl,
                color: Theme.of(context).hoverColor,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SmoothPageIndicator(
                effect: ExpandingDotsEffect(
                  dotColor: Theme.of(context).hintColor,
                  activeDotColor: Theme.of(context).primaryColor,
                  dotHeight: 6,
                  dotWidth: 6,
                ),
                controller: controler,
                count: 3,
              ),
            ),
          ),

          const SizedBox(height: 16),
          Text(
            onboardingModel.text1,
            style: textTheme.headlineMedium!.copyWith(
              fontSize: 24,
              color: Theme.of(context).splashColor,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Text(
                onboardingModel.text2,
                style: textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).hintColor,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
