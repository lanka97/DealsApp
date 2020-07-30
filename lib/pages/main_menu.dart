import 'package:flutter/material.dart';
import '../widgets/item_dialog.dart';
import '../models/food_item.dart';
import '../utils/size_config.dart';
import '../widgets/main_menu_item.dart';
import 'cart.dart';

class MainMenuPage extends StatefulWidget {
  @override
  _MainMenuPageState createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  int _selectedTab = 0;
  ScrollController _scrollController;

  final String _restaurant = "Yue Chuan";
  final String _venue = "The Kingsburry";

  List<String> _tabHeadings = [
    'Top Picks',
    'Burgers',
    'Submarines',
    'Wraps',
    'Salads',
    'Snacks'
  ];

  int _selectedMenuItem = 0;

  static String _image =
      "https://i.pinimg.com/736x/5e/2f/29/5e2f2901043dce299bc5ad1f49d3f6c7.jpg";
  static String _name = "Chicken Hamburger";
  static String _description = "Fresh food with good taste and the best deal.";

//  FoodItem menuFoodItem = FoodItem(
//    id: 1, image: _image, name: _name, description: _description, price: 30.00, category: ""
//  );

  List<FoodItem> tempMenuList = [];

  List<FoodItem> menuListDB = [
    FoodItem(
      id: 1,
      image:
          "https://b.zmtcdn.com/data/pictures/chains/3/17953943/3329656906df0fb9fe55d88f8b35ce6e.jpg",
      name: "Chicken Burger",
      description: _description,
      price: 300.00,
      category: "Burgers",
      isTopPick: true,
    ),
    FoodItem(
      id: 2,
      image:
          "https://hips.hearstapps.com/hmg-prod/images/delish-lemon-chicken-wraps-still002-1536963118.jpg",
      name: "Wraps",
      description: _description,
      price: 30.00,
      category: "Wraps",
      isTopPick: false,
    ),
    FoodItem(
      id: 3,
      image:
          "https://prods3.imgix.net/images/articles/2017_04/Feature-restaurant-butcher-bakery-shops2.jpg",
      name: "Chicken Submarine",
      description: _description,
      price: 400.00,
      category: "Submarines",
      isTopPick: false,
    ),
    FoodItem(
      id: 4,
      image:
          "https://prods3.imgix.net/images/articles/2017_04/Feature-restaurant-butcher-bakery-shops2.jpg",
      name: "Vege Submarine",
      description: _description,
      price: 300.00,
      category: "Submarines",
      isTopPick: false,
    ),
    FoodItem(
      id: 5,
      image: "https://blog.spriggy.com.au/content/images/2017/10/DSC_1110.jpg",
      name: "Snacks",
      description: _description,
      price: 200.00,
      category: "Snacks",
      isTopPick: false,
    ),
    FoodItem(
      id: 6,
      image: "https://blog.spriggy.com.au/content/images/2017/10/DSC_1110.jpg",
      name: "Snacks",
      description: _description,
      price: 200.00,
      category: "Snacks",
      isTopPick: true,
    ),
    FoodItem(
      id: 7,
      image:
          "https://hips.hearstapps.com/hmg-prod/images/delish-lemon-chicken-wraps-still002-1536963118.jpg",
      name: "Wraps",
      description: _description,
      price: 300.00,
      category: "Wraps",
      isTopPick: true,
    ),
    FoodItem(
      id: 8,
      image:
          "https://b.zmtcdn.com/data/pictures/chains/3/17953943/3329656906df0fb9fe55d88f8b35ce6e.jpg",
      name: "Vege Burger",
      description: _description,
      price: 300.00,
      category: "Burgers",
      isTopPick: true,
    ),
    FoodItem(
      id: 9,
      image:
          "https://previews.123rf.com/images/dolphytv/dolphytv1812/dolphytv181200058/113437543-layered-christmas-pasta-salad-with-red-cabbage.jpg",
      name: "Salads",
      description: _description,
      price: 300.00,
      category: "Salads",
      isTopPick: false,
    ),
    FoodItem(
      id: 10,
      image:
          "https://b.zmtcdn.com/data/pictures/chains/3/17953943/3329656906df0fb9fe55d88f8b35ce6e.jpg",
      name: "Burger",
      description: _description,
      price: 300.00,
      category: "Burgers",
      isTopPick: false,
    ),
    FoodItem(
      id: 11,
      image: "https://blog.spriggy.com.au/content/images/2017/10/DSC_1110.jpg",
      name: "Snacks",
      description: _description,
      price: 200.00,
      category: "Snacks",
      isTopPick: true,
    ),
    FoodItem(
      id: 12,
      image:
          "https://hips.hearstapps.com/hmg-prod/images/delish-lemon-chicken-wraps-still002-1536963118.jpg",
      name: "Tuna Wrap",
      description: _description,
      price: 30.00,
      category: "Wraps",
      isTopPick: false,
    ),
    FoodItem(
      id: 13,
      image:
          "https://previews.123rf.com/images/dolphytv/dolphytv1812/dolphytv181200058/113437543-layered-christmas-pasta-salad-with-red-cabbage.jpg",
      name: "Salads",
      description: _description,
      price: 300.00,
      category: "Salads",
      isTopPick: true,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        _selectedTab = (_scrollController.offset) ~/ (100);
        setState(() {
          print(_selectedTab);
        });
      });

    tempMenuList = getSelectedList(0);
  }

  List<FoodItem> getSelectedList(int selectedTabIndex) {
    List<FoodItem> tempList = [];
    for (FoodItem foodItem in menuListDB) {
      if (selectedTabIndex == 0 && foodItem.isTopPick) {
        tempList.add(foodItem);
      } else {
        if (_tabHeadings[selectedTabIndex] == foodItem.category) {
          tempList.add(foodItem);
        }
      }
    }

    return tempList;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 15.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 15.0,
                            backgroundColor: Colors.grey.withOpacity(0.4),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 20.0,
                            ),
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Expanded(
                          child: Text(
                            "Welcome to $_restaurant @ $_venue",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                                height: 1.1),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    _tabHeadings.length,
                    (index) => Container(
                      width: SizeConfig.blockSizeVertical,
                      margin: index == _tabHeadings.length - 1
                          ? EdgeInsets.only(left: 15.0, right: 15.0)
                          : EdgeInsets.only(left: 15.0, right: 0.0),
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            _selectedMenuItem = index;
                            print(_selectedMenuItem);
                            tempMenuList = getSelectedList(_selectedMenuItem);
                          });
                        },
                        color: _selectedMenuItem == index
                            ? Colors.black
                            : Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          _tabHeadings[index],
                          style: TextStyle(
                            color: _selectedMenuItem == index
                                ? Colors.white
                                : Colors.black,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                  ).toList(),
                ),
              ),
              SizedBox(height: 8.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: GridView.count(
                    childAspectRatio: (2 / 2.3),
                    crossAxisCount: 2,
                    scrollDirection: Axis.vertical,
                    children: List.generate(
                      tempMenuList.length,
                      (index) => GestureDetector(
                        onTap: () async {
                          print(tempMenuList[index].id);
                          await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content:
                                      ItemDialog(foodItem: tempMenuList[index]),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                );
                              });
                        },
                        child: MainMenuItem(menuFoodItem: tempMenuList[index]),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
                child: FlatButton(
                  onPressed: () async {
                    await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Cart(),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 10.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          );
                        });
                    setState(() {});
                    if (Order.order.orderConfirmed) {
                      Order.order.orderConfirmed = false;
                      await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Container(
                                width: 420,
                                height: 200,
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 25),
                                        child: Text(
                                          'Are you sure you want to order?',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 32),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            FlatButton(
                                                child: Text(
                                                  'Check the order',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                ),
                                                onPressed: () async {
                                                  await showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          content: Cart(),
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                            horizontal: 0.0,
                                                            vertical: 10.0,
                                                          ),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              15.0,
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                  if (Order
                                                      .order.items.isEmpty) {
                                                    Navigator.of(context).pop();
                                                  }
                                                }),
                                            RaisedButton(
                                              color: Color.fromRGBO(
                                                30,
                                                186,
                                                66,
                                                1,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(22.0),
                                              ),
                                              child: Container(
                                                height: 45.0,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.system_update_alt,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      ' Order',
                                                      style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              onPressed: () {
                                                Order.order.clear();
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            );
                          });
                    }
                    setState(() {});
                  },
                  color: Colors.red[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    width: SizeConfig.screenWidth,
                    child: Center(
                      child: Text(
                        Order.order.items.isEmpty
                            ? "Order"
                            : "Order (${Order.order.items.length})",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
