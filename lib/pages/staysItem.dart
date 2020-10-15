import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offpeak/pages/view_restaurant.dart';
import 'package:offpeak/utils/size_config.dart';

class StaysItem extends StatefulWidget {
  @override
  _StaysItemState createState() => _StaysItemState();
}

class _StaysItemState extends State<StaysItem> {
  bool _favourite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
      child: Card(
          borderOnForeground: false,
          elevation: 0,
          shadowColor: Colors.white,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewRestaurant(),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Image(
                      image: AssetImage(
                        'assets/images/hotel.jpg',
                      ),
                      width: SizeConfig.screenWidth * 0.98,
                      height: SizeConfig.screenHeight * 0.22,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    width: double.maxFinite,
                    margin: EdgeInsets.only(
                        top: SizeConfig.screenHeight * 0.0125,
                        right: SizeConfig.screenWidth * 0.025),
//                    child: InkWell(
//                      onTap: () => _addToFavourite(),
//                      child: Material(
//                          color: Colors.white,
//                          elevation: 100,
//                          shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.circular(100)),
//                          child: Padding(
//                            padding: const EdgeInsets.all(8.0),
//                            child: Icon(
//                              _favourite ? Icons.favorite : Icons.favorite_border,
//                              color: Colors.black54,
//                              size: SizeConfig.screenWidth * 0.04,
//                            ),
//                          )),
//                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    width: double.maxFinite,

                    margin: EdgeInsets.only(
                        top: SizeConfig.screenHeight * 0.02,
                        right: SizeConfig.screenWidth * 0.02),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5.0,0,5,0),
                          child: Text("20%",
                            style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 4,
//                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                        )
                    ),
                  ),
//                  Container(
//                    height: SizeConfig.screenHeight*0.22,
//                    alignment: Alignment.bottomCenter,
//                    child: Container(
//                      alignment: Alignment.bottomCenter,
//                      width: double.maxFinite,
//                      height: SizeConfig.screenHeight*0.063,
//                      child: Padding(
//                        padding: const EdgeInsets.only(left: 3.0),
//                        child: _buildList(),
//                      ),
//                      decoration: BoxDecoration(
//                          color: Colors.white.withOpacity(0.5)
//                      ),
//                    ),
//                  ),

                ]),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Habarana",
                          style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                            color: Color(0xFF4a4c4f),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.star,size: 15.0, color: Color(0xFFCC070B),),
                      Text("5.0",style: TextStyle(color: Color(0xFF4A4B71)),),
                      Text("(40)",style: TextStyle(color:Color(0xFFABB5CD)),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4,0,4,0),
                  child: Text(
                    "Kings Lodge Habarana",
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 5,
                      height: 1.1
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
                  child: Text(
                    "Starting From Rs. 5000.00",
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                      color: Color(0xFF4a4c4f),
                      height: 1.5,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget _buildList() {
//    if (false)
//      return Center(
//        child: Column(
//          mainAxisSize: MainAxisSize.min,
//          children: <Widget>[
//            Icon(Icons.local_movies),
//            Text(
//              "We cannot find any movies",
//              style: Theme.of(context).textTheme.headline6,
//            ),
//          ],
//        ),
//      );
//    return Padding(
//      padding: const EdgeInsets.all(8.0),
//      child: Container(
//        height: SizeConfig.screenHeight*0.05,
//        width: SizeConfig.screenWidth*0.98,
//        child: ListView.builder(
//            scrollDirection: Axis.horizontal,
//            itemCount: 5,
//            itemBuilder: (context, index) {
//              return Container(
//                child: Text("ffff"),
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(100),
//                  color: Colors.red,
//                ),
//              );
//        }),
//      ),
//    );

    return Container(
      height: SizeConfig.screenWidth * 0.12,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 2, left: 2, bottom: 3),
              child: Container(
                height: SizeConfig.screenWidth * 0.05,
                width: SizeConfig.screenWidth * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red[700],
                ),
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("21 Jul",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeHorizontal * 4)),
                        Text("20%",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeHorizontal * 5,
                                height: 1,
                                fontWeight: FontWeight.bold))
                      ],
                    )),
              ),
            );
          }),
    );
  }

  Future _addToFavourite() async {
    bool fav = !_favourite;

    setState(() {
      _favourite = fav;
    });
  }
}
