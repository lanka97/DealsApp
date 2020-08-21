import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:offpeak/pages/scan.dart';
import 'package:offpeak/utils/size_config.dart';
import 'package:offpeak/models/reserve.dart';
import 'package:offpeak/widgets/reserveHotel_card.dart';

class HotelReservation extends StatefulWidget {
  static const routeName = "hotelreservation";
  @override
  _HotelReservation createState() => _HotelReservation();
}

class _HotelReservation extends State<HotelReservation> {
  Reserve reserve = new Reserve("Test Resturant @ Colombo", "Tommorow",
      "10.30 a.m.", "10%", "2", "Colombo-01");
  ReserveHotel reserveHotel = new ReserveHotel(
      "Test Hotel - Colombo",
      "21st Jul - 23rd Jul",
      [
        PackageDetails("Deluxe Double Room", "Bed & Breakfast", 10, 800.00, 1000.00),
        PackageDetails("Deluxe Double Room", "Room Only", 10, 800.00, 1000.00),
      ]);

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
          title: Text(reserve.title,
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 5.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 6.0,
              //vertical: SizeConfig.blockSizeVertical * 4.0
            ),
            child: ListView(
              children: <Widget>[
                Text(
                  "Reservation Details",
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 5.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "21st Jul - 23rd Jul",
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 4.25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Card(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: SizeConfig.screenWidth * 0.4,
                              child: Text(
                                "Deluxe Double Room",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 3.75,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            Container(
//                          alignment: Alignment.centerRight,
                              width: SizeConfig.screenWidth * 0.1,
                              child: Text(
                                "x10",
                                style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              width: SizeConfig.screenWidth * 0.2,
                              child: Text(
                                "Rs. 800.00",
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              width: SizeConfig.screenWidth * 0.15,
                              child: Icon(Icons.close, color: Colors.red),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: SizeConfig.screenWidth * 0.5,
                              child: Text(
                                "Bed & Breakfast",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              width: SizeConfig.screenWidth * 0.2,
                              child: Text(
                                "Rs. 1000.00",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: SizeConfig.screenWidth * 0.8,
                                alignment: Alignment.centerLeft,
                                child: FlatButton(
//                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  onPressed: () {
                                  },
                                ),
                              ),
                            ]
                        ),
                      ],
                    ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: SizeConfig.screenWidth * 0.4,
                            child: Text(
                              "Deluxe Double Room",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 3.75,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          Container(
//                          alignment: Alignment.centerRight,
                            width: SizeConfig.screenWidth * 0.1,
                            child: Text(
                              "x10",
                              style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: SizeConfig.screenWidth * 0.2,
                            child: Text(
                              "Rs. 800.00",
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            width: SizeConfig.screenWidth * 0.15,
                            child: Icon(Icons.close, color: Colors.red),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: SizeConfig.screenWidth * 0.5,
                            child: Text(
                              "Bed & Breakfast",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: SizeConfig.screenWidth * 0.2,
                            child: Text(
                              "Rs. 1000.00",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: SizeConfig.screenWidth * 0.8,
                              alignment: Alignment.centerLeft,
                              child: FlatButton(
//                                  padding: const EdgeInsets.all(5),
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                onPressed: () {
                                },
                              ),
                            ),
                          ]
                      ),
                    ],
                  ),
                ),
                SizedBox(),
                Text(
                  "Payment Details",
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 5.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: SizeConfig.screenWidth * 0.6,
                            child: Text(
                              "Total Amount to be Paid",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 3.75,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: SizeConfig.screenWidth * 0.2,
                            child: Text(
                              "Rs. 8000.00",
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerRight,
                            width: SizeConfig.screenWidth * 0.8,
                            child: Text(
                              "Rs. 1000.00",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: SizeConfig.screenWidth * 0.6,
                            child: Text(
                              "Pay at Property",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 3.75,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: SizeConfig.screenWidth * 0.2,
                            child: Text(
                              "Rs. 6400.00",
                              style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: SizeConfig.screenWidth * 0.6,
                            child: Text(
                              "Book the Property (20%)",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 3.75,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: SizeConfig.screenWidth * 0.2,
                            child: Text(
                              "Rs. 1600.00",
                              style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: SizeConfig.screenWidth * 0.6,
                            child: Text(
                              "Use Promo Code",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 3.75,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: SizeConfig.screenWidth * 0.2,
                            child: TextField(
                              style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration.collapsed(
                                hintText: "Enter here",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
                            Container(
                              height: SizeConfig.screenHeight * 0.05,
                              child: Row(
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
                                  SizedBox(width: SizeConfig.blockSizeHorizontal * 8,),
                                  Expanded(
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
                            ),
                            SizedBox(height: SizeConfig.screenHeight * 0.01),
                            Container(
                              height: SizeConfig.screenHeight * 0.05,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Phone',
                                    style: TextStyle(
                                        fontSize:
                                        SizeConfig.blockSizeHorizontal * 4.5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: SizeConfig.blockSizeHorizontal * 8,),
                                  Expanded(
                                    child: TextFormField(
                                      //initialValue: "+94",
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
                            ),
                            SizedBox(height: SizeConfig.screenHeight * 0.01),
                            Container(
                              height: SizeConfig.screenHeight * 0.05,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'E-mail',
                                    style: TextStyle(
                                        fontSize:
                                        SizeConfig.blockSizeHorizontal * 4.5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: SizeConfig.blockSizeHorizontal * 8,),
                                  Expanded(
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
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Signup",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.blockSizeHorizontal * 6.0),
                        ),
                      ),
                      onTap: () {
                        print("value of your text");
                      },
                    ),
                  ],
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
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: SizeConfig.screenWidth * 0.4,
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Rs. 1600.00",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: SizeConfig.blockSizeHorizontal * 5.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text(
                                "Total Discount Rs. 2500.00",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                    fontWeight: FontWeight.w500,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          )
                        ),
                        Container(
                          height: SizeConfig.screenHeight * 0.075,
                          width: SizeConfig.screenWidth * 0.45,
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockSizeHorizontal * 10.0),
                            onPressed: () {
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
                                      "Pay Now",
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
                  ],
                ),

                SizedBox(height: SizeConfig.screenHeight * 0.01),
              ],
            ),
          ),
        ));
  }

}
