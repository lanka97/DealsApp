import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offpeak/utils/size_config.dart';

class RestaurantItem extends StatefulWidget {
  @override
  _RestaurantItemState createState() => _RestaurantItemState();
}

class _RestaurantItemState extends State<RestaurantItem> {
  bool _favourite = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;

    return Card(
      child: Column(
        children: [
          Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                image: AssetImage(
                  'assets/images/img.jpg',
                ),
                width: SizeConfig.screenWidth * 0.98,
                height: SizeConfig.screenHeight * 0.2,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              width: double.maxFinite,
              margin: EdgeInsets.only(
                  top: SizeConfig.screenHeight * 0.0125,
                  right: SizeConfig.screenWidth * 0.025),
              child: InkWell(
                onTap: () => _addToFavourite(),
                child: Material(
                    color: Colors.white,
                    elevation: 100,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        _favourite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.black54,
                        size: SizeConfig.screenWidth * 0.05,
                      ),
                    )),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text( "Ammage Reataurant EKa",
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal*5.5 ,
                      fontWeight: FontWeight.bold,
                    )
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      size: SizeConfig.screenWidth*0.05,
                      color: Colors.red,
                    ),
                    Text( "5.0",
                        style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal*4 ,
//                          fontWeight: FontWeight.bold,
                        )
                    ),
                    Text( "(40)",
                        style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal*4 ,
                          color: Colors.black45,
//                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future _addToFavourite() async {
    bool fav = !_favourite;

    setState(() {
      _favourite = fav;
    });
  }
}
