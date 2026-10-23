import 'package:evently_app/common/widgets/custom_event_card.dart';
import 'package:evently_app/providers/events_provider.dart';
import 'package:evently_app/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final them = Theme.of(context);
    final events = context.watch<EventsProvider>().favorites;
     final languageProvider = context.watch<LanguageProvider>();
    final isArabic = languageProvider.isArabic;
        return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: SizedBox(
              width: 380,
              child: TextFormField(
                onTapUpOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  hintText: isArabic? 'ابحث عن فعالية':'Search for event',
                  hintStyle: TextStyle(
                    color: them.hintColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  suffixIcon: Icon(Icons.search, color: them.primaryColor),
                  filled: true,
                  fillColor: them.cardColor,
                  contentPadding: const EdgeInsets.symmetric(
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
                    borderSide: BorderSide(color: them.focusColor, width: 1),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: events.isEmpty
                ? Center(
                    child: Text(
                      isArabic ?'لا توجد فعاليات مفضلة حتى الآن':'No favorite events yet',
                      style: them.textTheme.bodyLarge,
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