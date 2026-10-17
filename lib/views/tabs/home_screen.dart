import 'package:evently_app/common/widgets/custom_event_card.dart';
import 'package:evently_app/common/widgets/custom_home_header.dart';
import 'package:evently_app/providers/events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final events = context.watch<EventsProvider>().events;

    return Scaffold(
      body: Column(
        children: [
          const CustomHomeHeader(),
          Expanded(
            child: events.isEmpty
                ? Center(
                    child: Text(
                      'No events yet',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
                : ListView.separated(
                    itemCount: events.length,
                    itemBuilder: (context, index) =>
                        CustomEventCard(event: events[index]),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                  ),
          ),
        ],
      ),
    );
  }
}