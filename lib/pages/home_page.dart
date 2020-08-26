import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offpeak/pages/ActivityItem.dart';
import 'package:offpeak/pages/activities.dart';
import 'package:offpeak/pages/restaurants.dart';
import 'package:offpeak/pages/spaItem.dart';
import 'package:offpeak/pages/spas.dart';
import 'package:offpeak/pages/stays.dart';
import 'package:offpeak/pages/staysItem.dart';
import 'package:offpeak/utils/size_config.dart';
import 'package:offpeak/widgets/restaurantItem.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBar(),
      body: _buildBody(),
    );
  }
  Widget _customAppBar(){
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: <Widget>[
            Text("Happy Hour",style: TextStyle(color:
            Colors.black),),
            Spacer(),
            Icon(Icons.search,color: Colors.black,)
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: SizeConfig.blockSizeHorizontal *  3,),
          _buildTop(),
          Container(
            height: SizeConfig.blockSizeHorizontal * 50,
            color: Colors.grey,
          ),
          _titleWidget(title: "Top Eats",route: Restaurants.routeName),
          _topEats(),
          _titleWidget(title: "Top Stays",route: Stays.routeName),
          _topStays(),
          _titleWidget(title: "Top Activities",route: Activities.routeName),
          _topActivities(),
          _titleWidget(title: "Top Salons",route: Spas.routeName),

          _topSalon()
        ],
      ),
    );
  }

  Container _topEats() {
    //TODO: change sizes
    return Container(
          height: SizeConfig.screenWidth * 0.7,
          child: ListView.builder(
                      scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                    width: SizeConfig.screenWidth * 0.8,
                    child: RestaurantItem()
                );
              }),
        );
  }
  Container _topStays() {
    //TODO: change sizes
    return Container(
          height: SizeConfig.screenWidth * 0.7,
          child: ListView.builder(
                      scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                    width: SizeConfig.screenWidth * 0.8,
                    child: StaysItem()
                );
              }),
        );
  }
  Container _topActivities() {
    //TODO: change sizes
    return Container(
          height: SizeConfig.screenWidth * 0.7,
          child: ListView.builder(
                      scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                    width: SizeConfig.screenWidth * 0.8,
                    child: ActivityItem()
                );
              }),
        );
  }
  Container _topSalon() {
    //TODO: change sizes
    return Container(
          height: SizeConfig.screenWidth * 0.7,
          child: ListView.builder(
                      scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                    width: SizeConfig.screenWidth * 0.8,
                    child: SpaItem()
                );
              }),
        );
  }

  Widget _titleWidget({String title,String route}){
    final style = Theme.of(context).textTheme.headline6.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 6,fontWeight: FontWeight.bold);
    final viewStyle = Theme.of(context).textTheme.headline6.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 4,decoration: TextDecoration.underline,fontWeight: FontWeight.bold);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(title,style: style,),
          Spacer(),
          InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(route);
              },
              child: Text("View All",style: viewStyle,))
        ],
      ),
    );
  }

  Widget _buildTop() {
    return Container(
      height: SizeConfig.screenWidth * 0.3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Column(
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150)),
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal *15,
                      height: SizeConfig.blockSizeHorizontal *15,
                    ),
                  ),
                  Text("sample $index")
                ],
              ),
            );
          }),
    );
  }
}
