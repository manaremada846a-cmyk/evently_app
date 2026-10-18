import 'package:evently_app/common/theme/app_color.dart';
import 'package:evently_app/common/widgets/header_bottom_cards.dart';
import 'package:evently_app/common/category_images.dart';
import 'package:evently_app/model/event_card_model.dart';
import 'package:evently_app/providers/add_event_provider.dart';
import 'package:evently_app/providers/events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const List<(String, IconData)> _categories = [
  ('Book club', Icons.menu_book_rounded),
  ('Sport', Icons.directions_bike_outlined),
  ('Birthday', Icons.cake_outlined),
  ('Categories', Icons.access_time_filled),
  ('Meeting', Icons.meeting_room_outlined),
  ('Exhibition', Icons.store),
];

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});
  static String appRoute = "EventScreen";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = context.watch<AddEventProvider>();
    final images = CategoryImages.of(provider.selectedCategory); // صورة الكارت اللي فوق بس

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(15),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 24,
              decoration: BoxDecoration(
                color: theme.cardColor,
                border: Border.all(color: theme.focusColor),
                borderRadius: const BorderRadius.all(Radius.circular(2)),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: theme.hoverColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        title: Text("Add event", style: TextStyle(color: theme.splashColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 380,
                height: 220,
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  border: Border.all(color: theme.focusColor),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 50,
                      left: 20,
                      right: 20,
                      child: Image.asset(
                        images.under,
                        color: theme.hoverColor,
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        images.main,
                        width: 130,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 75,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 5),
                  itemBuilder: (context, i) {
                    final (label, icon) = _categories[i];
                    return HeaderBottomCards(
                      label: label,
                      icon: icon,
                      selected: provider.selectedCategory == label,
                      onSelected: () => provider.changeCategory(label),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Text(
                      "Title",
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: theme.splashColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 380,
                child: TextFormField(
                  controller: provider.titleController,
                  onTapUpOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: theme.splashColor),
                    hintText: 'Event Title',
                    hintStyle: TextStyle(
                      color: theme.hintColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    filled: true,
                    fillColor: theme.cardColor,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    border: _border(theme),
                    enabledBorder: _border(theme),
                    focusedBorder: _border(theme),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Text(
                      "Description ",
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: theme.splashColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 380,
                child: TextFormField(
                  controller: provider.descController,
                  onTapUpOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  minLines: 6,
                  maxLines: 40,
                  decoration: InputDecoration(
                    hintText: 'Event Description....',
                    hintStyle: TextStyle(
                      color: theme.hintColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    filled: true,
                    fillColor: theme.cardColor,
                    border: _border(theme),
                    enabledBorder: _border(theme),
                    focusedBorder: _border(theme),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                spacing: 10,
                children: [
                  Icon(
                    Icons.calendar_month_outlined,
                    color: theme.primaryColor,
                    size: 26,
                  ),
                  Text(
                    "Event Date",
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: theme.splashColor,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: provider.selectedDate ?? DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2040),
                      );
                      if (date != null) provider.changeDate(date);
                    },
                    child: Text(
                      provider.selectedDate == null
                          ? "Choose date"
                          : provider.selectedDate.toString().split(" ")[0],
                      style: _linkStyle(theme),
                    ),
                  ),
                ],
              ),
              Row(
                spacing: 10,
                children: [
                  Icon(
                    Icons.schedule_outlined,
                    color: theme.primaryColor,
                    size: 26,
                  ),
                  Text(
                    "Event Time",
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: theme.splashColor,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: provider.selectedTime ?? TimeOfDay.now(),
                      );
                      if (time != null) provider.changeTime(time);
                    },
                    child: Text(
                      provider.selectedTime?.format(context) ?? "Choose time",
                      style: _linkStyle(theme),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SafeArea(
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final error = provider.validate();
                      if (error != null) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(error)));
                        return;
                      }
                      final d = provider.selectedDate!;
                      final t = provider.selectedTime!;
                      final eventsProvider = context.read<EventsProvider>();
                      final messenger = ScaffoldMessenger.of(context);
                      final navigator = Navigator.of(context);
                      try {
                        await eventsProvider.addEvent(
                          EventCardModel(
                            title: provider.titleController.text.trim(),
                            description: provider.descController.text.trim(),
                            category: provider.selectedCategory,
                            dateTime: DateTime(
                              d.year,
                              d.month,
                              d.day,
                              t.hour,
                              t.minute,
                            ),
                          ),
                        );
                        navigator.pop();
                      } catch (e) {
                        messenger.showSnackBar(
                          SnackBar(content: Text('Failed to add event: $e')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                    ),
                    child: const Text(
                      "Add event",
                      style: TextStyle(
                        color: AppColors.whiteText,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _border(ThemeData theme) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: theme.focusColor, width: 1),
  );

  TextStyle _linkStyle(ThemeData theme) => TextStyle(
    decoration: TextDecoration.underline,
    decorationColor: theme.primaryColor,
    decorationThickness: 1.5,
    color: theme.primaryColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}