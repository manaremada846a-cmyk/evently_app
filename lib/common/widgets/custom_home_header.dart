import 'package:evently_app/common/theme/app_color.dart';
import 'package:evently_app/common/widgets/header_bottom_cards.dart';
import 'package:evently_app/providers/events_provider.dart';
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

class CustomHomeHeader extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(200);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = context.watch<EventsProvider>();

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
                      Text(
                        'name',
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
                        Icon(
                          Icons.wb_sunny_outlined,
                          size: 25,
                          color: theme.primaryColor,
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