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
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          _buildList(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "Yue Chuan @ The Kingsburry",
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 4.576,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
//                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.star,
                        size: SizeConfig.screenWidth * 0.05,
                        color: Colors.red,
                      ),
                      Text("5.0",
                          style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 3,
//                          fontWeight: FontWeight.bold,
                          ),
                        overflow: TextOverflow.ellipsis,),
                      Flexible(
                        child: Text("(40)",
                            style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                              color: Colors.black45,
//                          fontWeight: FontWeight.bold,
                            ),
                          overflow: TextOverflow.ellipsis,),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
            child: Text(
              "Colombo One - Rs 10000 for 2",
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 4.25,
                color: Colors.black45,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
            child: Text(
              "Thai - Chinese - Italian",
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 4.25,
                color: Colors.black45,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
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
      height: SizeConfig.screenWidth * 0.2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: SizeConfig.screenWidth * 0.15,
                    width: SizeConfig.screenWidth * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.red,
                    ),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("10.30",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: SizeConfig.blockSizeHorizontal * 3)),
                            Text("20%",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                                    fontWeight: FontWeight.bold))
                          ],
                        )),
                  ),
                );
          }

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
