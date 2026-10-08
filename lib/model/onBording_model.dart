import 'package:evently_app/gen/assets.gen.dart';

class OnBordingClass  {
String imageUrl;
String text1;
String text2;
OnBordingClass({required this.imageUrl,required this.text1,required this.text2});
List<OnBordingClass> get items => [
OnBordingClass(imageUrl:Assets.images.onbording1.path , text1: text1, text2: text2),
OnBordingClass(imageUrl: imageUrl, text1: text1, text2: text2),
OnBordingClass(imageUrl: imageUrl, text1: text1, text2: text2),
OnBordingClass(imageUrl: imageUrl, text1: text1, text2: text2)

];
}