import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offpeak/models/restaurant.dart';
import 'package:offpeak/pages/restaurants.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import '../utils/size_config.dart';

class Scan extends StatefulWidget{
  static const routeName = "scan";
  @override
  _Scan createState() => _Scan();
}

class _Scan extends State<Scan> {
  String scanResult = '';

  //function that launches the scanner
  Future scanQRCode() async {
    String cameraScanResult = await scanner.scan();
    setState(() {
      scanResult = cameraScanResult;
      Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => Restaurants(),
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(scanResult),
            SizedBox(height: 20),
            Container(
              height: SizeConfig.screenHeight * 0.075,
              child: FlatButton(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 8.0),
                onPressed: scanQRCode,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "Scan the QR Code",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.blockSizeHorizontal * 5.5
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
