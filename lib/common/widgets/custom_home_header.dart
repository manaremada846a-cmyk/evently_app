
import 'package:evently_app/common/widgets/header_bottom_cards.dart';
import 'package:evently_app/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomHomeHeader extends StatefulWidget
    implements PreferredSizeWidget {
  const CustomHomeHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(200);

  @override
  State<CustomHomeHeader> createState() => _CustomHomeHeaderState();
}

class _CustomHomeHeaderState extends State<CustomHomeHeader> {
  String selectedCategory = 'All';
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
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
                      Text(
                        'name',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(
                              fontSize: 20,
                              color: Theme.of(context).splashColor,
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
                        Icon(
                          Icons.wb_sunny_outlined,
                          size: 25,
                          color: Theme.of(context).primaryColor,
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
                              backgroundColor:
                                  Theme.of(context).primaryColor,
                            ),
                            child: Text(
                              'EN',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
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
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    HeaderBottomCards(
                 
                      label: 'All',
                      icon: Icons.grid_view_rounded,
                      selected: selectedCategory == 'All',
                      onSelected: () {
                        setState(() {
                          selectedCategory = 'All';
                        });
                      },
                    ),
                    const SizedBox(width: 5),
                    HeaderBottomCards(
                    
                      label: 'Sport',
                      icon: Icons.directions_bike_outlined,
                      selected: selectedCategory == 'Sport',
                      onSelected: () {
                        setState(() {
                          selectedCategory = 'Sport';
                        });
                      },
                    ),
                    const SizedBox(width: 5),
                    HeaderBottomCards(
                     
                      label: 'Birthday',
                      icon: Icons.cake_outlined,
                      selected: selectedCategory == 'Birthday',
                      onSelected: () {
                        setState(() {
                          selectedCategory = 'Birthday';
                        });
                      },
                    ),
                    const SizedBox(width: 5),
                    HeaderBottomCards(
                    
                      label: 'Categories',
                      icon: Icons.access_time_filled,
                      selected: selectedCategory == 'Categories',
                      onSelected: () {
                        setState(() {
                          selectedCategory = 'Categories';
                        });
                      },
                    ),
                     const SizedBox(width: 5),
                    HeaderBottomCards(
                    
                      label: 'Meeting',
                      icon: Icons.meeting_room_outlined,
                      selected: selectedCategory == 'Meeting',
                      onSelected: () {
                        setState(() {
                          selectedCategory = 'Meeting';
                        });
                      },
                    ), const SizedBox(width: 5),
                    HeaderBottomCards(
                    
                      label: 'Exhibition',
                      icon: Icons.store,
                      selected: selectedCategory ==  'Exhibition',
                      onSelected: () {
                        setState(() {
                          selectedCategory =  'Exhibition';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}