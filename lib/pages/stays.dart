import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offpeak/models/restaurant.dart';
import 'package:offpeak/pages/staysItem.dart';
import 'package:offpeak/utils/size_config.dart';

import '../utils/size_config.dart';

class Stays extends StatefulWidget {
  static const routeName = "stays";
  @override
  _StaysState createState() => _StaysState();
}

class _StaysState extends State<Stays> {
  RestaurantCard res = new RestaurantCard("this.img", "this.price", "this.name",
      "this.address", "this.verity", 5.0, 5);
  List<RestaurantCard> restaurant = [];

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
                Padding(
                  padding: const EdgeInsets.fromLTRB(13.0,10.0,10.0,5.0),
                  child: Text("Stays",
                      style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal * 9,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                  height: SizeConfig.screenHeight * 0.8725,
                  child: ListView.builder(
//                        scrollDirection: Axis.horizontal,
//                        physics: Scrollable(),
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return StaysItem();
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
