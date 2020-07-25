import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:offpeak/models/restaurant.dart';
import 'package:offpeak/utils/size_config.dart';

class ViewRestaurant extends StatefulWidget {
  static const routeName = "view_restaurant";
  @override
  _ViewRestaurantState createState() => _ViewRestaurantState();
}

class _ViewRestaurantState extends State<ViewRestaurant> with SingleTickerProviderStateMixin{
  Restaurant _restaurant = Restaurant();
  TextEditingController _dateController;
  TextEditingController _guestController;
  TextEditingController _voucherController;
  TabController _mainTabController ;
  int _tabIndex;
  int _selectedMenuIndex;
  @override
  void initState() {
    super.initState();
    _restaurant = Restaurant();
    _dateController = TextEditingController();
    _guestController = TextEditingController();
    _voucherController = TextEditingController();
    _tabIndex = 0;
    _mainTabController = TabController(length: 3, vsync: this,);
    _selectedMenuIndex = 0;
  }
  @override
  void dispose() {
    _mainTabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        _topImage(),
        _content()
      ],
    );
  }

  Widget _content() {
    final textTheme = Theme.of(context).textTheme;
    final redColor = Color(0xFFCC070B);
    final greyColor = Colors.grey;
    final blueGrey = Color(0xFFABB5CD);
    final darkBlue = Color(0xFF4A4B71);
    final borderSide = BorderSide(
        color: greyColor
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
              children: <Widget>[
                Expanded(child: Text(_restaurant.name,style: textTheme.headline6.copyWith(fontWeight: FontWeight.w900,fontSize: SizeConfig.blockSizeHorizontal * 6,color: darkBlue),)),
                Icon(Icons.star,color: Color(0xFFCC070B),),
                Text("${_restaurant.ratings}",style: TextStyle(color: darkBlue)),
                Text("(${_restaurant.voteCount})",style: TextStyle(color: blueGrey),),
              ],
            ),
          SizedBox(height: SizeConfig.blockSizeVertical,),
          Text(_restaurant.promotion,style: textTheme.headline4.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 4,fontWeight: FontWeight.bold,color:blueGrey),),
          SizedBox(height: SizeConfig.blockSizeVertical * 0.5,),
          Text(_restaurant.categories.join(", "),style: textTheme.headline4.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 4,fontWeight: FontWeight.bold,color: blueGrey),),
          SizedBox(height: SizeConfig.blockSizeVertical,),
          Container(
            height: SizeConfig.blockSizeHorizontal * 15,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _restaurant.promotionList.length,
              itemBuilder: (BuildContext context, int index) => _promotionListItem(_restaurant.promotionList[index], textTheme, redColor)
            ),
          ),
          Container(
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: _textFieldWidget(_TextField.Date),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: borderSide,
                                right: borderSide,
                              )
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 8),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border(
                                  bottom: borderSide
                                )
                            ),
                            child: _textFieldWidget(_TextField.Guests)
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: _textFieldWidget(_TextField.Voucher),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(child: _myTabView(),),
        ],
      ),
    );
  }

  Padding _promotionListItem(Promotion promotion, TextTheme textTheme, Color redColor) {
    return Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                height: SizeConfig.blockSizeHorizontal * 15,
                width: SizeConfig.blockSizeHorizontal * 15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(promotion.time,style: textTheme.headline6.copyWith(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal * 5),),
                    Text(promotion.percentage,style: textTheme.headline6.copyWith(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal * 4),),
                  ],
                ),
                decoration: BoxDecoration(
                  color: redColor,
                  shape: BoxShape.circle
                ),
              ),
            );
  }

  Widget _textFieldWidget(_TextField type){
    final hintStyle = Theme.of(context).textTheme.headline4.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 4.5,fontWeight: FontWeight.bold);
    final textStyle = hintStyle.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 4.5,fontWeight: FontWeight.bold,color: Colors.black);
    switch (type){
      case _TextField.Date:
        return TextField(
          style: textStyle,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration.collapsed(hintText: "Add Date",hintStyle: hintStyle),
        );
        break;
      case _TextField.Guests:
        return TextField(
          style: textStyle,
          keyboardType: TextInputType.number,
          decoration: InputDecoration.collapsed(hintText: "Add Guests",hintStyle: hintStyle),
        );
        break;
      case _TextField.Voucher:
        return TextField(
          style: textStyle,
          decoration: InputDecoration.collapsed(hintText: "Voucher Code (if any)",hintStyle: hintStyle),
        );
        break;
    }
  }

  Widget _topImage(){
    return Container(
      width: double.infinity,
      height: SizeConfig.blockSizeVertical * 35,
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: _restaurant.image,
            ),
          )
        ],
      ),
    );
  }



  Widget _myTabView() {
    final _tabs = [
      Tab(
        text: 'Menu',
      ),
      Tab(
        text: 'About',
      ),
      Tab(
        text: 'Reviews',
      ),
    ];
    final unselectedLabelColor = Color(0xFF4D4E74);
    final indicatorColor = Color(0xFFDF8B37);
    final labelColor = indicatorColor;
    final tabTextStyle = Theme.of(context).textTheme.headline6.copyWith(
      fontWeight: FontWeight.w900
    );
    return DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            TabBar(
              controller: _mainTabController,
              onTap: (index){
                setState(() {
                  _tabIndex = index;
                });
              },
              labelColor: labelColor,
              labelStyle: tabTextStyle,
              unselectedLabelStyle: tabTextStyle,
              indicatorColor: indicatorColor,
              unselectedLabelColor: unselectedLabelColor,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: _tabs,
            ),
            TabsView(
              tabIndex: _tabIndex,
              firstTab: _firstTabView(),
              secondTab: _secondTabView(),
              thirdTab: _thirdTabView(),
            )
          ],
        ));
  }
  Widget _firstTabView(){
    final textTheme = Theme.of(context).textTheme;
    final restaurantMenuList =_restaurant.restaurantMenuList;
    final menuTextSize = SizeConfig.blockSizeHorizontal * 3.7;
    final normalTextTheme = textTheme.headline6.copyWith(fontWeight: FontWeight.w800,fontSize: SizeConfig.blockSizeHorizontal * 4);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(_restaurant.menuText,style: normalTextTheme,),
          SizedBox(height: SizeConfig.blockSizeVertical,),
          Container(
            height: menuTextSize * 1.8,
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemCount: restaurantMenuList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final menu = restaurantMenuList[index];
                      final selectedStyle = normalTextTheme.copyWith(fontSize: menuTextSize * 0.8,color: Colors.white);
                      final unselectedStyle = normalTextTheme.copyWith(fontSize: menuTextSize,color: Color(0xFF8F9199));
                      final style = _selectedMenuIndex == index ? selectedStyle:unselectedStyle;
                      final child = GestureDetector(
                          onTap: (){
                            setState(() {
                              _selectedMenuIndex = index;
                            });
                          },
                          child: Container(
                              height: menuTextSize * 1.8,
                              padding: const EdgeInsets.only(left: 5,right: 5),
                              alignment: Alignment.center,
                              child: Text(menu.menuName,style: style,)));
                      if(_selectedMenuIndex == index){
                        return Card(
                          color: Colors.black,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                          ),
                          child: child,
                        );
                      }
                      return child;
                    },
                  ),
                ),
                SizedBox(width: SizeConfig.blockSizeHorizontal *1.5,),
                Text("${_restaurant.restaurantMenuList[_selectedMenuIndex].offer} %",style: textTheme.headline6.copyWith(color: Color(0xFFDF8B37)),)
              ],
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: restaurantMenuList[_selectedMenuIndex].restaurantMenuItems.length,
            itemBuilder: (context, index) {
              final menu = restaurantMenuList[_selectedMenuIndex].restaurantMenuItems[index];
              final textStyle = normalTextTheme.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 3.7,fontWeight: FontWeight.w700);
              final discount = restaurantMenuList[_selectedMenuIndex].offer;
              return Padding(
                padding: const EdgeInsets.only(top:5),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text(menu.name,style: textStyle,)),
                    Text("Rs. ${menu.price}",style: textStyle.copyWith(decoration: TextDecoration.lineThrough,color: Color(0xFFAEB8CF)),),
                    SizedBox(width: SizeConfig.blockSizeHorizontal*2,),
                    Text("Rs. ${menu.price * (100-discount)/100}",style: textStyle.copyWith(color: Color(0xFFDF8B37)),),
                  ],
                ),
              );
            },

          ),
          SizedBox(height: SizeConfig.blockSizeVertical,),
          Text(_restaurant.noteOne,style: normalTextTheme,),
          SizedBox(height: SizeConfig.blockSizeVertical,),
          Text(_restaurant.noteTwo,style: normalTextTheme,),
          SizedBox(height: SizeConfig.blockSizeVertical,),
          Text("Special Conditions",style: normalTextTheme.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 6,fontWeight: FontWeight.w900,color: Color(0xFF4A4B71)),),
          SizedBox(height: SizeConfig.blockSizeVertical,),
          Text(_restaurant.specialCondition,style: normalTextTheme,),
        ],
      ),
    );
  }
  Widget _secondTabView(){
    final textTheme = Theme.of(context).textTheme;
    final normalTextSize =SizeConfig.blockSizeHorizontal * 4;
    final normalTextTheme = textTheme.headline6.copyWith(fontWeight: FontWeight.w800,fontSize: normalTextSize);
    final titleTextTheme = normalTextTheme.copyWith(fontWeight: FontWeight.w900,fontSize: SizeConfig.blockSizeHorizontal * 6,color: Color(0xFF4A4B71));
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(_restaurant.about,style: normalTextTheme,),
          SizedBox(height: SizeConfig.blockSizeVertical * 2,),
          _topTextRowAbout("Atmosphere", _restaurant.atmospheres),
          _topTextRowAbout("Facilities", _restaurant.facilities),
          _topTextRowAbout("Payment", _restaurant.payment),
          SizedBox(height: SizeConfig.blockSizeVertical * 2,),
          Divider(thickness: 1.5,),
          SizedBox(height: SizeConfig.blockSizeVertical * 2,),
          Text("Location",style: titleTextTheme,),
          SizedBox(height: SizeConfig.blockSizeVertical * 2,),
          Container(
            height: SizeConfig.blockSizeVertical * 20,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("https://www.google.com/maps/d/thumbnail?mid=1kAhPSwEpcFA5oqTsZlEukpt8bkQ&hl=en")
              )
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical * 2,),
          Text("Opening Hours",style: titleTextTheme,),
          SizedBox(height: SizeConfig.blockSizeVertical * 1,),
          Container(child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _restaurant.openingHours.length, itemBuilder: (BuildContext context, int index) {
              final day = _restaurant.openingHours[index];
              return Row(
                children: <Widget>[
                  Text(day.day,style: normalTextTheme,),
                  Spacer(),
                  Text("${day.openAt}a.m. - ${day.closeAt}p.m.",style: normalTextTheme,)
                ],
              );
          },
          ),),
        ],
      ),
    );
  }
  Widget _topTextRowAbout(String name,List<String> list){
    final textTheme = Theme.of(context).textTheme;
    final normalTextSize =SizeConfig.blockSizeHorizontal * 4;
    final normalTextTheme = textTheme.headline6.copyWith(fontWeight: FontWeight.w800,fontSize: normalTextSize);
    final topSpacing = normalTextSize * 7;
    return           Row(
      children: <Widget>[
        Container(
            width:  topSpacing,
            child: Text(name,style: normalTextTheme.copyWith(color: Color(0xFF4A4B71)),)),
        Expanded(child: Text(list.join(","),style: normalTextTheme,))
      ],
    );
  }
  
  Widget _thirdTabView(){
    return Container();
  }

}
enum _TextField{Date,Guests,Voucher}

class TabsView extends StatelessWidget {
  TabsView(
      {Key key,
        @required this.tabIndex,
        @required this.firstTab,
        @required this.secondTab,
        @required this.thirdTab,
      })
      : super(key: key);

  final int tabIndex;
  final Widget firstTab;
  final Widget secondTab;
  final Widget thirdTab;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          child: firstTab,
          width: SizeConfig.screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          transform: Matrix4.translationValues(
              tabIndex == 0 ? 0 : -SizeConfig.screenWidth, 0, 0),
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        ),
        AnimatedContainer(
          child: secondTab,
          width: SizeConfig.screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          transform: Matrix4.translationValues(
              tabIndex == 1 ? 0 : tabIndex == 2? -SizeConfig.screenWidth: SizeConfig.screenWidth, 0, 0),
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        ),
        AnimatedContainer(
          child: thirdTab,
          width: SizeConfig.screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          transform: Matrix4.translationValues(
              tabIndex == 2 ? 0 : SizeConfig.screenWidth, 0, 0),
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        ),
      ],
    );
  }
}