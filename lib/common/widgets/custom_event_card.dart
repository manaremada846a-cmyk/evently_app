import 'package:evently_app/model/event_card_model.dart';
import 'package:flutter/material.dart';

class CustomEventCard extends StatefulWidget {
  const CustomEventCard({super.key, required this.event});
  final EventCardModel event;
  @override
  State<CustomEventCard> createState() => _CustomEventCardState();
}

class _CustomEventCardState extends State<CustomEventCard> {
  @override
  Widget build(BuildContext context) {
    ThemeData them = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: 380,
        height: 220,
        decoration: BoxDecoration(
          color: them.cardColor,
          border: Border.all(color: them.focusColor),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 20,
              right: 20,
               
              child: Image.asset(
                widget.event.getImageunder,
                color: them.hoverColor,
                       
              ),
            ),
            Center(child: Image.asset(widget.event.getImage,width: 130,)),
            Positioned(
              left: 7,
              top: 7,
              child: Container(
                width: 66,
                height: 40,
                decoration: BoxDecoration(color: them.canvasColor,border: Border.all(color: them.focusColor),borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(child: Text(widget.event.date,style: Theme.of(context).textTheme. headlineMedium!.copyWith(fontSize: 16,color: them.primaryColor))),
                        
              ),
            ), Positioned(
              left: 7,
              bottom: 7,
              child: Container(
                width: 360,
                height: 50,
                decoration: BoxDecoration(color: them.canvasColor,border: Border.all(color: them.focusColor),borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(widget.event .discribtion,style: Theme.of(context).textTheme. headlineMedium!.copyWith(fontSize: 14,color: them.splashColor)),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          widget.event .isFav=! widget.event .isFav;
                          setState(() {
                            
                          });
                        },
                        child: Icon(
                          widget.event .isFav?
                          Icons.favorite:Icons.favorite_border_outlined,color: them.primaryColor,),
                      )
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
