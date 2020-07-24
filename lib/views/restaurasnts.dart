import 'package:flutter/material.dart';
import 'package:offpeak/models/restaurant.dart';
import 'package:offpeak/utils/size_config.dart';
import 'package:offpeak/views/restaurantItem.dart';

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

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text( "Reataurants",
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal*10,
                    fontWeight: FontWeight.bold,
                  )
            ),
            RestaurantItem(),
            RestaurantItem(),
          ],
        ),
      ),
    );
  }
}
