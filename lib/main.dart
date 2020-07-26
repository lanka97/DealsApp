import 'package:flutter/material.dart';
import 'package:offpeak/pages/view_restaurant.dart';
import 'package:offpeak/utils/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      routes: {
        ViewRestaurant.routeName: (context) => ViewRestaurant()
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
    return ViewRestaurant();
    return Scaffold(
      appBar: AppBar(
      ),
    );
  }
}
