import 'package:evently_app/common/widgets/custom_event_card.dart';
 import 'package:evently_app/gen/assets.gen.dart';

import 'package:evently_app/model/event_card_model.dart';

import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<EventCardModel> events = [
    EventCardModel(
      getImageunder: Assets.images.sport2.path,
      getImage: Assets.images.sportboy.path,
      date: "data",
      discribtion: "mmmmmmmmmmmm",
      isFav: true,
    ),
    EventCardModel(
      getImageunder: Assets.images.sport2.path,
      getImage: Assets.images.sportboy.path,
      date: "data",
      discribtion: "mmmmmmmmmmmm",
      isFav: true,
    ),
    EventCardModel(
      getImageunder: Assets.images.sport2.path,
      getImage: Assets.images.sportboy.path,
      date: "data",
      discribtion: "mmmmmmmmmmmm",
      isFav: true,
    ),EventCardModel(
      getImageunder: Assets.images.sport2.path,
      getImage: Assets.images.sportboy.path,
      date: "data",
      discribtion: "mmmmmmmmmmmm",
      isFav: true,)
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData them = Theme.of(context);
    return Scaffold(
      body: Column( 
        children: [
          SafeArea(
            child: SizedBox(width: 380,
              child: TextFormField(onTapUpOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
  
                decoration: InputDecoration(
                  hintText: 'Search for event',
                  hintStyle: TextStyle(
                    color:them.hintColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: them.primaryColor,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: them.focusColor,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: events.length,
              itemBuilder: (BuildContext context, int index) {
                final event = events[index];
                return CustomEventCard(event: event);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 15);
              },
            ),
          ),
        ],
      ),
    );
  }
}
