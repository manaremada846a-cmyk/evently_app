import 'package:evently_app/common/widgets/header_bottom_cards.dart';
import 'package:evently_app/theme/app_color.dart';
  import 'package:flutter/material.dart';

class CustomHomeHeader extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeHeader({super.key});
 
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SafeArea(
        child: Container(
          width: preferredSize.width,
          height: 150,
          decoration: BoxDecoration(),

          child: Column(spacing: 0,
            children: [
              Row(
                children: [
                  Column(
                    spacing: 7,
                    crossAxisAlignment: .start,
                    children: [
                      Text("Welcome Back ✨"),
                      Text(
                        "name",
                        style: Theme.of(context).textTheme.bodyLarge!
                            .copyWith(fontSize: 20)
                            .copyWith(color: Theme.of(context).splashColor),
                      ),
                    ],
                  ),

                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Row(
                      spacing: 10,
                      
                      crossAxisAlignment: .center,
                      children: [
                        Icon(   
                          Icons.wb_sunny_outlined,
                          size: 25,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 32,
                          height: 32,
                          child: FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom( padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          alignment: Alignment.center,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                            child: Text(
                              "EN",
                              style: Theme.of(context).textTheme.headlineMedium!
                                  .copyWith(fontSize: 14)
                                  .copyWith(color: AppColors.whiteText),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              Expanded(
                child: ListView(
                  scrollDirection:  Axis.horizontal,

                  
                    children: [
                      HeaderBottomCards(
                        label: "All",
                        icon:Icons.grid_view_rounded,
                        selected: true,
                        onSelected: () {},
                      ),SizedBox(width: 5,), HeaderBottomCards(
                        label: "Sport",
                        //	Icons.pedal_bike أو Icons.directions_bike
                        icon: Icons.directions_bike_outlined,
                        selected: false,
                        onSelected: () {},
                      ),SizedBox(width: 5,), HeaderBottomCards(
                        label: "Birthday",
                        icon: 	Icons.cake_outlined,
                        selected: false,
                        onSelected: () {},
                      ),SizedBox(width: 5,), HeaderBottomCards(
                        label: "Categories",
                        icon: Icons.access_time_filled,
                        selected: false,
                        onSelected: () {},
                      ),SizedBox(width: 5,), HeaderBottomCards(
                        label: "All",
                        icon: Icons.access_time_filled,
                        selected: false,
                        onSelected: () {},
                      ), 
                    ],
                  
                  
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(AppBar().preferredSize.width, 200);
}
