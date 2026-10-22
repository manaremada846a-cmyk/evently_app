import 'package:evently_app/gen/assets.gen.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:evently_app/views/screens/auth/login_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static String appRoute = "profile";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser;
  String? get name => user!.displayName;
  String? get email => user!.email;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final themeProvider = context.watch<ThemeProvider>();
    final isDark = themeProvider.isDark;
    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: 10,
          children: [
            SizedBox(height: 40),
            Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),

                  child: Image.asset(
                    Assets.images.profileRoute.path,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            Text(
              user!.displayName ?? "name",
              style: Theme.of(context).textTheme.headlineMedium!
                  .copyWith(color: Theme.of(context).splashColor, fontSize: 20),
            ),
            Text(
              user!.email ?? "email",
              style: Theme.of(context).textTheme.bodyMedium!
                  .copyWith(color: Theme.of(context).hintColor, fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Dark mode
            customContainer(
              text: 'Dark mode',
              theme: theme,
              trailing: Switch(
                value: isDark,
               onChanged: (value) {
      if (value) {
        themeProvider.changTheme(ThemeMode.dark);
      } else {
        themeProvider.changTheme(ThemeMode.light);
      }
    },
                activeThumbColor: theme.primaryColor,
                inactiveThumbColor: theme.hintColor,
              ),
            ),

            // Language
            customContainer(
              text: 'Language',
              theme: theme,
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 23,
                color: theme.primaryColor,
              ),
            ),

            // Logout
            customContainer(
              text: 'Logout',
              theme: theme,
              trailing: InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  if (!context.mounted) return;
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    LoginScreen.appRoute,
                    (route) => false,
                  );
                },
                child: Icon(Icons.logout, size: 26, color: Colors.redAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customContainer({
    required String text,
    required ThemeData theme,
    required Widget trailing,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.focusColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(
              text,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.splashColor,
              ),
            ),
            const Spacer(),
            trailing,
          ],
        ),
      ),
    );
  }
}
