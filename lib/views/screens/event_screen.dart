import 'package:evently_app/common/widgets/header_bottom_cards.dart';
import 'package:evently_app/gen/assets.gen.dart';
import 'package:evently_app/theme/app_color.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});
  static String appRoute = "EventScreen";

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String selectedText = "sport";
  List<String> imagesunder = [Assets.images.sport2.path];
  List<String> images = [Assets.images.sportboy.path];
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      //splashColor
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(15),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 24,
              decoration: BoxDecoration(
                color: theme.cardColor,
                border: Border.all(color: theme.focusColor),
                borderRadius: BorderRadius.all(Radius.circular(2)),
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
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 50,
                      left: 20,
                      right: 20,

                      child: Image.asset(
                        imagesunder[0],
                        color: theme.hoverColor,
                      ),
                    ),
                    Center(child: Image.asset(images[0], width: 130)),
                  ],
                ),
              ),
              SizedBox(
                height: 75,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    HeaderBottomCards(
                      label: 'Book club',
                      icon: Icons.menu_book_rounded,
                      selected: selectedText == 'Bookclub',
                      onSelected: () {
                        setState(() {
                          selectedText = 'Bookclub';
                        });
                      },
                    ),
                    const SizedBox(width: 5),
                    HeaderBottomCards(
                      label: 'Sport',
                      icon: Icons.directions_bike_outlined,
                      onSelected: () {
                        setState(() {
                          selectedText = "sport";
                        });
                      },
                      selected: selectedText == "sport",
                    ),
                    const SizedBox(width: 5),
                    HeaderBottomCards(
                      label: 'Birthday',
                      icon: Icons.cake_outlined,
                      onSelected: () {
                        setState(() {
                          selectedText = 'Birthday';
                        });
                      },
                      selected: selectedText == 'Birthday',
                    ),
                    const SizedBox(width: 5),
                    HeaderBottomCards(
                      label: 'Categories',
                      icon: Icons.access_time_filled,
                      onSelected: () {
                        setState(() {
                          selectedText = 'Categories';
                        });
                      },
                      selected: selectedText == 'Categories',
                    ),
                    const SizedBox(width: 5),
                    HeaderBottomCards(
                      label: 'Meeting',
                      icon: Icons.meeting_room_outlined,
                      onSelected: () {
                        setState(() {
                          selectedText = 'Meeting';
                        });
                      },
                      selected: selectedText == 'Meeting',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Text(
                      "Title",
                      style: Theme.of(context).textTheme.bodyLarge!
                          .copyWith(color: theme.splashColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 380,
                child: TextFormField(
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
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: theme.focusColor, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: theme.focusColor, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: theme.focusColor, width: 1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Text(
                      "Description ",
                      style: Theme.of(context).textTheme.bodyLarge!
                          .copyWith(color: theme.splashColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 380,
                child: TextFormField(
                  //
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

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: theme.focusColor, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: theme.focusColor, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: theme.focusColor, width: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
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
                    style: Theme.of(context).textTheme.bodyLarge!
                        .copyWith(color: theme.splashColor),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () async {
                      DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: selectedDate ?? DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2040),
                      );

                      if (date != null) {
                        setState(() {
                          selectedDate = date;
                        });
                      }
                    },
                    child: Text(
                      selectedDate == null
                          ? "Choose date"
                          : selectedDate.toString().split(" ")[0],
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: theme.primaryColor,
                        decorationThickness: 1.5,
                        color: theme.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
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
                    style: Theme.of(context).textTheme.bodyLarge!
                        .copyWith(color: theme.splashColor),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () async {
                      TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (time != null) {
                        setState(() {
                          selectedTime = time;
                        });
                      }
                    },
                    child: Text(
                      selectedTime?.format(context)??
                           "Event Time"
                          ,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: theme.primaryColor,
                        decorationThickness: 1.5,
                        color: theme.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              SafeArea(
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                    ),
                    child: Text(
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
}
