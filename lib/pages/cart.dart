import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offpeak/utils/size_config.dart';
import '../models/food_item.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Order List',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.blockSizeHorizontal * 7.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    size: SizeConfig.blockSizeHorizontal * 10.0,
                    color: Colors.black.withOpacity(0.7),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 6.0),
            height: SizeConfig.blockSizeVertical * 4.0,
            color: Color.fromRGBO(241, 243, 249, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    'Item',
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Quantity',
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                    ),
                  ),
                )
              ],
            ),
          ),
          Order.order.items.isEmpty
              ? Container(
                  height: SizeConfig.screenHeight * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.remove_shopping_cart,
                        size: SizeConfig.blockSizeHorizontal * 20.0,
                      ),
                      Text(
                        'Nothing to show',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockSizeHorizontal * 7.0,
                        ),
                      )
                    ],
                  ),
                )
              : Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        for (int i = 0; i < Order.order.items.length; i++)
                          Container(
                            color: i % 2 == 0
                                ? Colors.white
                                : Color.fromRGBO(247, 250, 252, 1),
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            height: SizeConfig.blockSizeVertical * 6.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  Order.order.items[i].itemName,
                                  style: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 4.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        Order.order.items[i].quantity
                                            .toString(),
                                        style: TextStyle(
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal *
                                                  4.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 6.0,
                                    ),
                                    GestureDetector(
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          Order.order.items.remove(
                                            Order.order.items.firstWhere(
                                              (element) =>
                                                  element.itemId ==
                                                  Order.order.items[i].itemId,
                                            ),
                                          );
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                ),
          Order.order.items.isEmpty
              ? Text('')
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        right: SizeConfig.blockSizeHorizontal * 5.0,
                      ),
                      child: RaisedButton(
                        color: Color.fromRGBO(30, 186, 66, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            SizeConfig.blockSizeHorizontal * 6.0,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.system_update_alt,
                              color: Colors.white,
                              size: SizeConfig.blockSizeHorizontal * 5.0,
                            ),
                            Text(
                              Order.order.items.length > 0
                                  ? ' Order (${Order.order.items.length})'
                                  : ' Order',
                              style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 5.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        onPressed: () async {
                          Order.order.orderConfirmed = true;
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
