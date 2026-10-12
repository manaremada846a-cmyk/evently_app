import 'package:evently_app/common/widgets/custom_event_card.dart';
import 'package:evently_app/common/widgets/custom_home_header.dart';
import 'package:evently_app/gen/assets.gen.dart';

import 'package:evently_app/model/event_card_model.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});
  

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<EventCardModel> events = [
    EventCardModel(
      getImageunder: Assets.images.sport2.path,
      getImage: Assets.images.sportboy.path,
      date: "data",
      discribtion: "mmmmmmmmmmmm",
      isFav: true,
    ), EventCardModel(
      getImageunder: Assets.images.sport2.path,
      getImage: Assets.images.sportboy.path,
      date: "data",
      discribtion: "mmmmmmmmmmmm",
      isFav: true,
    ), EventCardModel(
      getImageunder: Assets.images.sport2.path,
      getImage: Assets.images.sportboy.path,
      date: "data",
      discribtion: "mmmmmmmmmmmm",
      isFav: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomHomeHeader(),
          Expanded(
            child: ListView.separated(
              itemCount: events.length,
              itemBuilder: (BuildContext context, int index) {
                final event = events[index];
                return CustomEventCard(event: event);
              }, separatorBuilder: (BuildContext context, int index) {return SizedBox(height: 15,) ;},
            ),
          )
          , 
        ],
      ),
    );
  }
}
