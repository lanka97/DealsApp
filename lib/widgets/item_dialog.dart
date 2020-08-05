import 'package:flutter/material.dart';
import 'package:offpeak/utils/size_config.dart';
import '../models/food_item.dart';

class ItemDialog extends StatefulWidget {
  FoodItem foodItem;

  ItemDialog({this.foodItem});

  @override
  _ItemDialogState createState() => _ItemDialogState();
}

class _ItemDialogState extends State<ItemDialog> {
  List<AddOn> addon = [
    AddOn(addon: 'CocaCola', price: 100),
    AddOn(addon: 'Sprite', price: 100),
    AddOn(addon: 'Chicken', price: 200),
    AddOn(addon: 'Chicken Double Layer', price: 350),
    AddOn(addon: 'Cheese', price: 100),
    AddOn(addon: 'Double Cheese', price: 150),
  ];

  List<String> variances = ['Small', 'Medium', 'Large'];
  String variance;
  int quantity = 1;
  int itemPrice = 300;
  Map<String, bool> selectedAddons = {};
  final noteController = TextEditingController();
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < addon.length; i++) {
      selectedAddons[addon[i].addon] = false;
    }
    itemPrice = widget.foodItem.price.floor();
  }

  int price() {
    int price;
    price = itemPrice * quantity;
    selectedAddons.forEach((key, value) {
      if (value == true)
        price += addon.firstWhere((element) => key == element.addon).price;
    });
    return price;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600.0,
      height: 684.0,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.foodItem.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: SizeConfig.blockSizeHorizontal * 6,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: SizeConfig.blockSizeHorizontal * 8,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
          Text(
            widget.foodItem.description,
            style: TextStyle(
              color: Color.fromRGBO(136, 136, 136, 1),
              fontSize: SizeConfig.blockSizeHorizontal * 5.0,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 4.0),
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 20.0,
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 7.0)
                        ],
                        image: DecorationImage(
                          image: NetworkImage(
                            widget.foodItem.image,
                          ),
                          fit: BoxFit.cover,
                        )),
                  ),
                  if (variances.length > 0)
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Variances',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeHorizontal * 5.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: SizeConfig.screenWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              variances.length,
                              (index) => Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Radio(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      value: variances[index],
                                      groupValue: variance,
                                      activeColor: Colors.green,
                                      onChanged: (String value) {
                                        setState(() {
                                          variance = value;
                                          print(variance);
                                        });
                                      },
                                    ),
                                    Text(
                                      variances[index],
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal *
                                                  4.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  if (addon.length > 0)
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Add-ons',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeHorizontal * 5.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeHorizontal * 4.0),
                          width: SizeConfig.screenWidth,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                for (int i = 0;
                                    i <
                                        (addon.length % 3 == 0
                                            ? addon.length / 3
                                            : (addon.length ~/ 3) + 1);
                                    i++)
                                  Row(
                                    children: <Widget>[
                                      for (int j = 0; j < 3; j++)
                                        Container(
                                          width: SizeConfig.screenWidth * 0.5,
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: SizeConfig
                                                          .blockSizeHorizontal *
                                                      4.0,
                                                  vertical: SizeConfig
                                                          .blockSizeVertical *
                                                      1.0,
                                                ),
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    8,
                                                height: SizeConfig
                                                        .blockSizeHorizontal *
                                                    8,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    3.0,
                                                  ),
                                                  border: Border.all(
                                                    color: Color.fromRGBO(
                                                      112,
                                                      112,
                                                      112,
                                                      1,
                                                    ),
                                                  ),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 7.0,
                                                      color: Colors.black
                                                          .withOpacity(0.1),
                                                      spreadRadius: 1.0,
                                                    )
                                                  ],
                                                ),
                                                child: GestureDetector(
                                                  child: selectedAddons[
                                                          addon[i * 3 + j]
                                                              .addon]
                                                      ? Icon(
                                                          Icons.done,
                                                          color: Colors.green,
                                                        )
                                                      : Text(''),
                                                  onTap: () {
                                                    setState(() {
                                                      if (selectedAddons[
                                                          addon[i * 3 + j]
                                                              .addon]) {
                                                        selectedAddons[
                                                            addon[i * 3 + j]
                                                                .addon] = false;
                                                      } else {
                                                        selectedAddons[
                                                            addon[i * 3 + j]
                                                                .addon] = true;
                                                      }
                                                    });
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                  child: Text(
                                                addon[i * 3 + j].addon,
                                                style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .blockSizeHorizontal *
                                                        3.5,
                                                    height: SizeConfig
                                                            .blockSizeHorizontal *
                                                        0.5),
                                              )),
                                            ],
                                          ),
                                        )
                                    ],
                                  )
                              ],
                            ),
                            scrollDirection: Axis.horizontal,
                          ),
                        )
                      ],
                    ),
                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeHorizontal * 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Note',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(
                              SizeConfig.blockSizeHorizontal * 3.0),
                          margin: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 3.0),
                          width: SizeConfig.screenWidth * 0.5,
                          height: 40.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10.0,
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1.0,
                                ),
                              ]),
                          child: TextField(
                            controller: noteController,
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 4.0),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  'Add a note (add sauce, no onions etc.)',
                              hintStyle: TextStyle(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal * 3.0),
                              hintMaxLines: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: SizeConfig.blockSizeVertical * 2.0,
                    ),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeHorizontal * 5.0),
                        width: SizeConfig.screenWidth * 0.4,
                        height: SizeConfig.blockSizeVertical * 8.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border:
                              Border.all(color: Color.fromRGBO(30, 186, 66, 1)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 9.0,
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1.0,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.remove,
                                color: Color.fromRGBO(30, 186, 66, 1),
                              ),
                              onPressed: () {
                                setState(() {
                                  // ignore: unnecessary_statements
                                  quantity > 1 ? quantity-- : quantity;
                                });
                              },
                            ),
                            Text(
                              quantity.toString(),
                              style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 6.0,
                                color: Color.fromRGBO(30, 186, 66, 1),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Color.fromRGBO(30, 186, 66, 1),
                              ),
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              margin:
                  EdgeInsets.only(top: SizeConfig.blockSizeHorizontal * 3.0),
              child: RaisedButton(
                color: Color.fromRGBO(30, 186, 66, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Container(
                  width: SizeConfig.screenWidth * 0.6,
                  height: SizeConfig.blockSizeVertical * 7.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Rs. ' +
                            price().toString().replaceAllMapped(reg, mathFunc) +
                            '.00',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Add $quantity to Cart',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
                onPressed: () {
                  OrderItem item = new OrderItem();
                  item.itemId = widget.foodItem.id;
                  item.itemName =
                      widget.foodItem.name + " - " + item.itemId.toString();
                  item.price = price();
                  item.quantity = quantity;
                  item.note = noteController.text;
                  item.variance = variance;
                  selectedAddons.forEach((key, value) {
                    if (value == true) {
                      item.selectedAddons.add(
                        addon.firstWhere((element) => element.addon == key),
                      );
                    }
                  });

                  OrderItem currentItem = Order.order.items.firstWhere(
                      (element) => element.itemId == widget.foodItem.id,
                      orElse: () => null);
                  if (currentItem != null) {
                    Order.order.items.remove(currentItem);
                  }
                  Order.order.items.add(item);
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
