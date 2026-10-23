
 import 'package:evently_app/common/widgets/header_bottom_cards.dart';
import 'package:evently_app/providers/events_provider.dart';
import 'package:evently_app/providers/language_provider.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomHomeHeader extends StatefulWidget {
  const CustomHomeHeader({super.key});

  @override
  State<CustomHomeHeader> createState() => _CustomHomeHeaderState();
}

class _CustomHomeHeaderState extends State<CustomHomeHeader> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = context.watch<EventsProvider>();
    final themeProvider = context.watch<ThemeProvider>();
    final languageProvider = context.watch<LanguageProvider>();

    final isDark = themeProvider.isDark;
    final isArabic = languageProvider.isArabic;

    final homeCategories = <(String, String, IconData)>[
      ('All', isArabic ? 'الكل' : 'All', Icons.grid_view_rounded),
      ('Book club', isArabic ? 'نادي الكتاب' : 'Book club', Icons.menu_book_rounded),
      ('Sport', isArabic ? 'رياضة' : 'Sport', Icons.directions_bike_outlined),
      ('Birthday', isArabic ? 'عيد ميلاد' : 'Birthday', Icons.cake_outlined),
      ('Meeting', isArabic ? 'اجتماع' : 'Meeting', Icons.meeting_room_outlined),
      ('Exhibition', isArabic ? 'معرض' : 'Exhibition', Icons.store),
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: SafeArea(
        child: SizedBox(
          height: 120,
          child: Column(
            spacing: 15,
            children: [
              Row(
                children: [
                  Column(
                    spacing: 7,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(isArabic ? 'أهلاً بعودتك ✨' : 'Welcome Back ✨'),
                      Text(
                        user?.displayName ?? (isArabic ? 'الاسم' : 'Name'),
                        style: theme.textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          color: theme.splashColor,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Row(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            themeProvider.changTheme(
                              isDark ? ThemeMode.light : ThemeMode.dark,
                            );
                          },
                          child: isDark
                              ? Transform.rotate(
                                angle: 700,
                                child: Icon(
                                    Icons.mode_night_outlined,
                                    size: 22,
                                    color: theme.primaryColor,
                                  ),
                              )
                              : Icon(
                                  Icons.wb_sunny_outlined,
                                  size: 25,
                                  color: theme.primaryColor,
                                ),
                        ),
                        SizedBox(
                          width: 32,
                          height: 32,
                          child: FilledButton(
                            onPressed: () {
                              languageProvider.changeLanguage();
                            },
                            style: FilledButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              alignment: Alignment.center,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              backgroundColor: theme.primaryColor,
                            ),
                            child: Text(
                              isArabic ? 'AR' : 'EN',
                              style: theme.textTheme.headlineMedium!.copyWith(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeCategories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 5),
                  itemBuilder: (context, i) {
                    final (categoryKey, label, icon) = homeCategories[i];

                    return HeaderBottomCards(
                      label: label,
                      icon: icon,
                      selected: provider.selectedCategory == categoryKey,
                      onSelected: () => provider.changeCategory(categoryKey),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
