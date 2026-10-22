import 'package:evently_app/common/theme/app_color.dart';
import 'package:evently_app/common/widgets/header_bottom_cards.dart';
import 'package:evently_app/providers/events_provider.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const List<(String, IconData)> _homeCategories = [
  ('All', Icons.grid_view_rounded),
  ('Book club', Icons.menu_book_rounded),
  ('Sport', Icons.directions_bike_outlined),
  ('Birthday', Icons.cake_outlined),
  ('Meeting', Icons.meeting_room_outlined),
  ('Exhibition', Icons.store),
];

class CustomHomeHeader extends StatefulWidget  {
  const CustomHomeHeader({super.key});

  @override
  State<CustomHomeHeader> createState() => _CustomHomeHeaderState();

}

class _CustomHomeHeaderState extends State<CustomHomeHeader> {

    final user= FirebaseAuth.instance.currentUser;
    String? get name => user!.displayName;

  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = context.watch<EventsProvider>();
    ThemeProvider themeProvider=context.watch<ThemeProvider>();
    bool isDark=themeProvider.isDark;

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
                      const Text('Welcome Back ✨'),
                      Text( user?.displayName ?? 'name',
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
                          onTap: (){
if(isDark){
  themeProvider.changTheme(ThemeMode.light);
}else{
   themeProvider.changTheme(ThemeMode.dark);
}  
                          },
                          child:isDark?Transform.rotate(
                            angle: 700,
                            child: Icon(  Icons.mode_night_outlined,
                              size: 25,
                              color: theme.primaryColor,),
                          ):  Icon(
                            Icons.wb_sunny_outlined,
                            size: 25,
                            color: theme.primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 32,
                          height: 32,
                          child: FilledButton(
                            onPressed: () {},
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
                              'EN',
                              style: theme.textTheme.headlineMedium!.copyWith(
                                fontSize: 14,
                                color: AppColors.whiteText,
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
                  itemCount: _homeCategories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 5),
                  itemBuilder: (context, i) {
                    final (label, icon) = _homeCategories[i];
                    return HeaderBottomCards(
                      label: label,
                      icon: icon,
                      selected: provider.selectedCategory == label,
                      onSelected: () => provider.changeCategory(label),
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