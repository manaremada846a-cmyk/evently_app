import 'package:evently_app/gen/assets.gen.dart';

typedef CategoryImage = ({String under, String main});

class CategoryImages {
  CategoryImages._();

  
  static final Map<String, CategoryImage> _images = {
    'Book club': (
      under: Assets.images.bookClub.path,
      main: Assets.images.bookclubimage.path,
    ),
    'Sport': (
      under: Assets.images.sport2.path,
      main: Assets.images.sportboy.path,
    ),
    
    'Birthday': (
      under: Assets.images.birthday.path,
      main: Assets.images.birthdayimag.path,
    ),
    'Meeting': (
      under: Assets.images.meeting.path,
      main: Assets.images.meetingimag.path,
    ),
    'Exhibition': (
      under: Assets.images.exhibition.path,
      main: Assets.images.exhibitionimage.path,
    ),
  }; //'Birthday'

  // لحد ما تتضاف صور باقي الكاتيجوريز، بتاخد صورة الـ Sport
  static CategoryImage of(String category) =>
      _images[category] ?? _images['Sport']!;
}
