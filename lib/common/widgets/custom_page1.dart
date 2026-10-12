import 'package:evently_app/gen/assets.gen.dart';
import 'package:evently_app/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomPage1 extends StatefulWidget {
  const CustomPage1({super.key});

  @override
  State<CustomPage1> createState() => _CustomPage1State();
}

class _CustomPage1State extends State<CustomPage1> {
  String selectedButon = "English";
  String selectedIcon="sun";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Image.asset(
            Assets.images.onbording1.path,
            color: Theme.of(context).hoverColor,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                "Personalize Your Experience",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).splashColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Text(
                "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
          ),
          Row(spacing: 10,
            children: [
              Text(
                "Language",
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontSize: 20,
                  color: Theme.of(context).hoverColor,
                ),
              ),
              Spacer(),
              SizedBox(
                width: 90,
                height: 35,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: selectedButon == "English"
                        ? theme.primaryColor
                        : theme.cardColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: theme.focusColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedButon = "English";
                    });
                  },

                  child: Text(
                    "English",
                    style: theme.textTheme.headlineMedium!.copyWith(
                      fontSize: 14,
                      color: selectedButon == "English"
                          ? AppColors.whiteText
                          : theme.hoverColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
               width: 90,
                height: 35,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: selectedButon == "arabic"
                        ? theme.primaryColor
                        : theme.cardColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: theme.focusColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedButon = "arabic";
                    });
                  },

                  child: Text(
                    "Arabic",
                    style: theme.textTheme.headlineMedium!.copyWith(
                      fontSize: 14,
                      color: selectedButon == "arabic"
                          ? AppColors.whiteText
                          : theme.hoverColor,
                    ),
                  ),
                ),
              ),
            ],
          ), Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(spacing: 10,
              children: [
                Text(
                  "Theme",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 20,
                    color: Theme.of(context).hoverColor,
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 60,
                  height: 35,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor:  selectedIcon=="sun"
                          ? theme.primaryColor
                          : theme.cardColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: theme.focusColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedIcon="sun";
                      });
                    },
            child: Icon(Icons.wb_sunny, color:  selectedIcon=="sun"
                           ? AppColors.whiteText
                            : theme.hoverColor,size: 25,),
                    
                  ),
                ),
                SizedBox(
                 width: 60,
                  height: 35,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor:  selectedIcon=="mode"
                          ? theme.primaryColor
                          : theme.cardColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: theme.focusColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedIcon="mode";
                      });
                    },
            
                    child: Transform.rotate(
                      angle:2.5,
                      child: Icon(Icons.mode_night_outlined

                      , color:   selectedIcon=="mode"
                             ? AppColors.whiteText
                              : theme.hoverColor,size: 25,),
                    ),
                    
                  
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
