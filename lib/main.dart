import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:offpeak/pages/reservation.dart';
import 'package:offpeak/pages/scan.dart';
import 'package:offpeak/pages/view_restaurant.dart';
import 'package:offpeak/utils/size_config.dart';
import 'package:offpeak/pages/restaurants.dart';

/// Only for [NormalPreview]
void main() {
  runApp(MyApp());
}


/// Only for [DevicePreview]
//void main() => runApp(
//  DevicePreview(
//    enabled: !kReleaseMode,
//    builder: (context) => MyApp(),
//  ),
//);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
//      locale: DevicePreview.of(context).locale, /// Only for [DevicePreview] - comment this for [Normal Preview]
//      builder: DevicePreview.appBuilder, /// Only for [DevicePreview] - comment this for [Normal Preview]
      title: 'Happy Hour',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      routes: {
        ViewRestaurant.routeName: (context) => ViewRestaurant(),
        Restaurants.routeName: (context) => Restaurants(),
        Reservation.routeName: (context) => Reservation(),
        Scan.routeName: (context) => Scan()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Restaurants();
  }
}
