import 'dart:ui';

import 'package:flutter/material.dart';

class RestaurantItem extends StatefulWidget {
  @override
  _RestaurantItemState createState() => _RestaurantItemState();
}

class _RestaurantItemState extends State<RestaurantItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image( image: AssetImage('assets/images/img.jpg'),),
    );
  }
}
