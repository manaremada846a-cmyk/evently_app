import 'package:evently_app/gen/assets.gen.dart';

class OnboardingModel {
  final String imageUrl;
  final String text1;
  final String text2;

  const OnboardingModel({
    required this.imageUrl,
    required this.text1,
    required this.text2,
  });

  static final List<OnboardingModel> items = [ OnboardingModel(imageUrl:Assets.images.pageview2.path  , text1: "Find Events That Inspire You", text2: "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you."),
OnboardingModel(imageUrl:Assets.images.onbording3.path  , text1: "Effortless Event Planning", text2: "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests."),
OnboardingModel(imageUrl:Assets.images.onbording4.path  , text1: "Connect with Friends & Share Moments", text2:"Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.")]; // التلاتة بالبيانات
}/** 
 */