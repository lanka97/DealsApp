import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offpeak/models/restaurant.dart';
import 'package:offpeak/utils/size_config.dart';
import 'package:offpeak/pages/restaurantItem.dart';

class Restaurants extends StatefulWidget {
  @override
  _RestaurantsState createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  Restaurant res = new Restaurant("this.img", "this.price", "this.name", "this.address", "this.verity",
      5.0, 5);
  List<Restaurant> restaurant = [];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    restaurant.add(res);
    restaurant.add(res);

    return Scaffold(
//        appBar: AppBar(
//          elevation: 0.0,
//          backgroundColor: Colors.white,
////          leading: IconButton(
////            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
////            onPressed: () => Navigator.of(context).pop(),
////          ),
//          title: Text(
//              "",
//              style: TextStyle(
//                fontWeight: FontWeight.bold,
//                color: Colors.black,
//
//              )
//          ),
//          centerTitle: false,
//        ),
        backgroundColor: Colors.white,

        body: SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( "Reataurants",
                      style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal*9 ,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  RestaurantItem(),
                  RestaurantItem(),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
