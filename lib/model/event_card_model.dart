
 
class EventCardModel {
  final String title;
  final String category;
  final String getImageunder;
  final String getImage;
  final String date;
  final String discribtion;
  bool isFav;
 
  EventCardModel({
    required this.title,
    required this.category,
    required this.getImageunder,
    required this.getImage,
    required this.date,
    required this.discribtion,
    this.isFav = false,
  });
}
 
 
