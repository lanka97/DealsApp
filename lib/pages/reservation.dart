import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offpeak/pages/scan.dart';
import '../utils/size_config.dart';


class Reservation extends StatefulWidget{
  @override
  _Reservation createState() => _Reservation();
}


class _Reservation extends State<Reservation> {
  var _data = "Yue Chuan @ The Kingburry";
  var _date = "Tommorow";
  var _time = "10.30 a.m.";
  var _discount = "10%";
  var _people = 2;
  var _location = "Colombo-01";

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
          title: Text(
              "Reservation Details",
              style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              )
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: ListView(
            children: <Widget>[
              Text(
                _data,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 20.0, vertical: SizeConfig.blockSizeVertical * 5.0),
                child: Card(
                  color: Colors.white,
                  shadowColor: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 3.0),
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
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                _date,
                                style: TextStyle(
                                    fontSize: 17.0
                                ),
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
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                _time,
                                style: TextStyle(
                                    fontSize: 17.0
                                ),
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
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                _discount,
                                style: TextStyle(
                                    fontSize: 17.0
                                ),
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
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "$_people People",
                                style: TextStyle(
                                    fontSize: 17.0
                                ),
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
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                _location,
                                style: TextStyle(
                                    fontSize: 17.0
                                ),
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
                    fontSize: 24.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.01),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 3.0),
                child: Card(
                  color: Colors.white,
                  shadowColor: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 6.0),
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
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width:SizeConfig.screenWidth * 0.6,
                                height: SizeConfig.screenHeight * 0.05,
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.grey
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)
                                      ),
                                      borderSide: new BorderSide(
                                          color: Colors.grey
                                      ),
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
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                width:SizeConfig.screenWidth * 0.6,
                                height: SizeConfig.screenHeight * 0.05,
                                child: TextFormField(
                                  initialValue: "+94",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.grey
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)
                                      ),
                                      borderSide: new BorderSide(
                                          color: Colors.grey
                                      ),
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
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                width:SizeConfig.screenWidth * 0.6,
                                height: SizeConfig.screenHeight * 0.05,
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.grey
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)
                                      ),
                                      borderSide: new BorderSide(
                                          color: Colors.grey
                                      ),
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
                      fontSize: 24.0
                  ),
                ),
                onTap: () {print("value of your text");},
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By clicking on "Confirm the Reservation", I agree with the  ',
                        style: TextStyle(color: Colors.black54),
                      ),
                      TextSpan(
                          text: 'Terms & Conditions',
                          style: TextStyle(color: Colors.orange)
                      ),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(color: Colors.black54),
                      ),
                      TextSpan(
                          text: 'Privacy Policy.',
                          style: TextStyle(color: Colors.orange)
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              Container(
                height: SizeConfig.screenHeight * 0.075,
                child: FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 8.0),
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
                                fontSize: 22.0
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}

