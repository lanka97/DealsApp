import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offpeak/models/restaurant.dart';
import 'package:offpeak/pages/ActivityItem.dart';
import 'package:offpeak/utils/size_config.dart';

import '../utils/size_config.dart';

class Activities extends StatefulWidget {
  static const routeName = "restaurants";
  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  RestaurantCard res = new RestaurantCard("this.img", "this.price", "this.name",
      "this.address", "this.verity", 5.0, 5);
  List<RestaurantCard> restaurant = [];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    restaurant.add(res);
    restaurant.add(res);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
            "Activities",
            style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 5,
              fontWeight: FontWeight.bold,
              color: Colors.black,

            )
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(13.0,0.0,10.0,0),
                  child: Column(
                    children: [
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
//                        scrollDirection: Axis.horizontal,
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return ActivityItem();
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
