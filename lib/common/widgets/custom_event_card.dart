import 'package:evently_app/model/event_card_model.dart';
import 'package:evently_app/providers/events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomEventCard extends StatelessWidget {
  const CustomEventCard({super.key, required this.event});
  final EventCardModel event;

  @override
  Widget build(BuildContext context) {
    final them = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: 380,
        height: 220,
        decoration: BoxDecoration(
          color: them.cardColor,
          border: Border.all(color: them.focusColor),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Image.asset(event.getImageunder, color: them.hoverColor),
            ),
            Center(child: Image.asset(event.getImage, width: 130)),
            Positioned(
              left: 7,
              top: 7,
              child: Container(
                width: 66,
                height: 40,
                decoration: BoxDecoration(
                  color: them.canvasColor,
                  border: Border.all(color: them.focusColor),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text(
                    event.date,
                    style: them.textTheme.headlineMedium!.copyWith(
                      fontSize: 14,
                      color: them.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 7,
              bottom: 7,
              child: Container(
                width: 360,
                height: 50,
                decoration: BoxDecoration(
                  color: them.canvasColor,
                  border: Border.all(color: them.focusColor),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          event.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: them.textTheme.headlineMedium!.copyWith(
                            fontSize: 14,
                            color: them.splashColor,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () =>
                            context.read<EventsProvider>().toggleFav(event),
                        child: Icon(
                          event.isFav
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: them.primaryColor,
                        ),
                      ),
                    ],
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