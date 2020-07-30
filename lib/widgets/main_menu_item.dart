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
          margin: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 8.0,
          ),
          height: 180,
          width: 169,
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
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  menuFoodItem.name,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  menuFoodItem.description,
//                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black54, fontSize: 10.0),
                ),
                Text(
                  "Rs " + menuFoodItem.price.toStringAsFixed(2),
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0.0,
          left: 0.0,
          child: CircleAvatar(
            radius: 50.0,
            backgroundImage: NetworkImage(menuFoodItem.image),
          ),
        )
      ],
    );
  }
}
