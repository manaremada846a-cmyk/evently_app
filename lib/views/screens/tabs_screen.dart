import 'package:evently_app/common/theme/app_color.dart';
import 'package:evently_app/providers/events_provider.dart';
import 'package:evently_app/views/screens/event_screen.dart';
import 'package:evently_app/views/tabs/favorite_screen.dart';
import 'package:evently_app/views/tabs/home_screen.dart';
import 'package:evently_app/views/tabs/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  static String appRoute = "TabsScreen";

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [HomeScreen(), FavoriteScreen(), ProfileScreen()];

  @override
  void initState() {
    super.initState();
    // يبدأ يسمع لإيفنتات اليوزر الحالي من Firestore
    context.read<EventsProvider>().startListening();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, EventScreen.appRoute);
          },
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.add, color: AppColors.whiteText, size: 30),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: BottomNavigationBar(
            backgroundColor: Theme.of(context).cardColor,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.favorite),
                icon: Icon(Icons.favorite_border),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.person),
                icon: Icon(Icons.person_2_outlined),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}