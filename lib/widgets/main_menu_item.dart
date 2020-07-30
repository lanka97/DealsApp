import 'package:flutter/material.dart';
import 'package:offpeak/utils/size_config.dart';
import '../models/food_item.dart';

class MainMenuItem extends StatelessWidget {
  final FoodItem menuFoodItem;

  const MainMenuItem({Key key, this.menuFoodItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(
            vertical: SizeConfig.blockSizeVertical * 2.0,
            horizontal: SizeConfig.blockSizeHorizontal * 4.0,
          ),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 3,
                blurRadius: 7,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 4.2,
              vertical: SizeConfig.blockSizeVertical * 1.5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  menuFoodItem.name,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: SizeConfig.blockSizeHorizontal * 2.8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  menuFoodItem.description,
//                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: SizeConfig.blockSizeHorizontal * 2.7,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Rs " + menuFoodItem.price.toStringAsFixed(2),
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: SizeConfig.blockSizeHorizontal * 3.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0.0,
          left: 0.0,
          child: CircleAvatar(
            radius: SizeConfig.blockSizeHorizontal * 13.0,
            backgroundImage: NetworkImage(menuFoodItem.image),
          ),
        )
      ],
    );
  }
}
