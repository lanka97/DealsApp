import 'package:flutter/material.dart';
import '../models/food_item.dart';
import '../utils/size_config.dart';
import '../widgets/main_menu_item.dart';

class MainMenuPage extends StatefulWidget {
  @override
  _MainMenuPageState createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  int _selectedTab = 0;
  ScrollController _scrollController;

  List<String> _tabHeadings = [
    'Top Picks',
    'Burgers',
    'Submarines',
    'Wraps',
    'Salads',
    'Snacks'
  ];

  FoodItem menuFoodItem = FoodItem(
      id: 1,
      image:
          "https://i.pinimg.com/736x/5e/2f/29/5e2f2901043dce299bc5ad1f49d3f6c7.jpg",
      name: "Chicken Hamburger",
      description: "Fresh hamburger with chicken, salad, tomatoes.",
      price: 30.00,
      category: "");

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
//          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "Hi Sandul",
                              style: Theme.of(context).textTheme.headline5,
                            ),
//                Text("Past Orders"),
//                Text("Loyalty Points"),
                          ],
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
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: FlatButton(
                        onPressed: () {},
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          _tabHeadings[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    ),
                  ).toList(),
                ),
              ),
              SizedBox(height: 8.0),
              Expanded(
                child: ListView(
                  controller: _scrollController,
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: List.generate(
                          _tabHeadings.length,
                          (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 8.0,
                                ),
                                child: Text(
                                  _tabHeadings[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                    15,
                                    (index) => Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8.0,
                                        top: 8.0,
                                      ),
                                      child: MainMenuItem(
                                        menuFoodItem: menuFoodItem,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 20.0,
                      ),
                      child: FlatButton(
                        onPressed: () {},
                        color: Colors.red[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          "Order (5)",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
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
    );
  }
}
