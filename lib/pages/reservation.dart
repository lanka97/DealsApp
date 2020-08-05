import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offpeak/pages/scan.dart';
import 'package:offpeak/utils/size_config.dart';
import 'package:offpeak/models/reserve.dart';

class Reservation extends StatefulWidget {
  static const routeName = "reservation";
  @override
  _Reservation createState() => _Reservation();
}

class _Reservation extends State<Reservation> {
  Reserve reserve = new Reserve("Yue Chuan @ The Kingburry", "Tommorow",
      "10.30 a.m.", "10%", "2", "Colombo-01");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Reservation Details",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 7.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: ListView(
            children: <Widget>[
              Text(
                reserve.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 6.0,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 20.0,
                    vertical: SizeConfig.blockSizeVertical * 4.0),
                child: Card(
                  color: Colors.white,
                  shadowColor: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 3.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Date',
                                style: TextStyle(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal * 4.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                reserve.date,
                                style: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 4.0),
                              )
                            ],
                          ),
                          SizedBox(height: SizeConfig.screenHeight * 0.005),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Time',
                                style: TextStyle(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal * 4.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                reserve.time,
                                style: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 4.0),
                              )
                            ],
                          ),
                          SizedBox(height: SizeConfig.screenHeight * 0.005),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Discount',
                                style: TextStyle(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal * 4.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                reserve.discount,
                                style: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 4.0),
                              )
                            ],
                          ),
                          SizedBox(height: SizeConfig.screenHeight * 0.005),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'People',
                                style: TextStyle(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal * 4.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                reserve.people + " People",
                                style: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 4.0),
                              )
                            ],
                          ),
                          SizedBox(height: SizeConfig.screenHeight * 0.005),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Location',
                                style: TextStyle(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal * 4.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                reserve.location,
                                style: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 4.0),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                "User Details",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 6.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.01),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 3.0),
                child: Card(
                  color: Colors.white,
                  shadowColor: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 6.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Name',
                                style: TextStyle(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal * 4.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.screenWidth * 0.6,
                                height: SizeConfig.screenHeight * 0.05,
                                child: TextField(
                                  style: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 4.5,
                                  ),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          new BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: SizeConfig.screenHeight * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Phone',
                                style: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 4.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: SizeConfig.screenWidth * 0.6,
                                height: SizeConfig.screenHeight * 0.05,
                                child: TextFormField(
                                  initialValue: "+94",
                                  style: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 4.5,
                                  ),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          new BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: SizeConfig.screenHeight * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'E-mail',
                                style: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 4.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: SizeConfig.screenWidth * 0.6,
                                height: SizeConfig.screenHeight * 0.05,
                                child: TextField(
                                  style: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 4.5,
                                  ),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          new BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              InkWell(
                child: Text(
                  "Signup",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.blockSizeHorizontal * 6.0),
                ),
                onTap: () {
                  print("value of your text");
                },
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Container(
                margin: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'By clicking on "Confirm the Reservation", I agree with the  ',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: SizeConfig.blockSizeHorizontal * 3.75),
                      ),
                      TextSpan(
                          text: 'Terms & Conditions',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: SizeConfig.blockSizeHorizontal * 3.75)),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: SizeConfig.blockSizeHorizontal * 3.75),
                      ),
                      TextSpan(
                          text: 'Privacy Policy.',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: SizeConfig.blockSizeHorizontal * 3.75))
                    ],
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Container(
                height: SizeConfig.screenHeight * 0.075,
                child: FlatButton(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 8.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scan(),
                      ),
                    );
                  },
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
                            "Confirm the Reservation",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeHorizontal * 5.5),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
