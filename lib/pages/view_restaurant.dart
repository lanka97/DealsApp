import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:offpeak/models/restaurant.dart';
import 'package:offpeak/pages/reservation.dart';
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
  static const _fontName = "HelveticaNeu";
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
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
              children: <Widget>[
                Expanded(child: Text(_restaurant.name,style: textTheme.headline6.copyWith(fontWeight: FontWeight.w900, color: Color(0xFF000000), fontSize: SizeConfig.blockSizeHorizontal * 5.5, fontFamily: _fontName),)),
              ],
            ),
          SizedBox(height: SizeConfig.blockSizeVertical,),
          Row(
            children: <Widget>[
              Expanded(child: RichText(
//                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                      'Colombo 1',
                      style: textTheme.headline4.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 4,color: Color(0xFF4a4c4f)),
                    ),
                    TextSpan(
                        text: '  |  ',
                      style: textTheme.headline4.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 4,color: Color(0xFF4a4c4f)),),
                    TextSpan(
                      text: 'Rs 1000 for 2 ',
                        style: textTheme.headline4.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 4,color: Color(0xFF4a4c4f)),
                    ),
                  ],
                ),
              ),),
              //Expanded(child: Text(_restaurant.promotion,style: textTheme.headline4.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 4,fontWeight: FontWeight.bold,color:blueGrey),)),
              Icon(Icons.star,color: Color(0xFFCC070B),),
              Text("${_restaurant.ratings}",style: TextStyle(color: darkBlue,fontFamily: _fontName)),
              Text("(${_restaurant.voteCount})",style: TextStyle(color: blueGrey,fontFamily: _fontName),),
            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical * 0.2,),
          Text(_restaurant.categories.join(" | "),style: textTheme.headline4.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 4,color: Color(0xFF4a4c4f)),),
          SizedBox(height: SizeConfig.blockSizeVertical,),
          Container(
            height: SizeConfig.blockSizeHorizontal * 13,
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
                    Container(
                      child: _reserveButton(),
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
    final color = double.parse(promotion.percentage.replaceAll("%", '').trim())>15.0? redColor: Colors.deepOrange;
    return Padding(
              padding: const EdgeInsets.only(right: 2),
              child: Container(
                width: SizeConfig.blockSizeHorizontal * 24,
                child: Card(
                  color: color,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(promotion.time,style: textTheme.headline6.copyWith(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal * 3.5,fontFamily: _fontName),),
                      Text(promotion.percentage,style: textTheme.headline6.copyWith(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal * 4.5,fontFamily: _fontName, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            );
  }

  Widget _textFieldWidget(_TextField type){
    final hintStyle = Theme.of(context).textTheme.headline3.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 3.8,fontWeight: FontWeight.w500);
    final textStyle = hintStyle.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 3.8,fontWeight: FontWeight.w500,color: Colors.black);
    switch (type){
      case _TextField.Date:
        return TextField(
          style: textStyle,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.date_range),
              hintText: "Add Date",hintStyle: hintStyle,
              border: InputBorder.none

          ),
        );
        break;
      case _TextField.Guests:
        return TextField(
          style: textStyle,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.confirmation_number),
              hintText: "Add Guests",hintStyle: hintStyle,
              border: InputBorder.none

          ),
        );
        break;
      case _TextField.Voucher:
        return TextField(
          textAlign: TextAlign.center,
          style: textStyle,
          decoration: InputDecoration.collapsed(hintText: "Voucher Code (if any)",hintStyle: hintStyle),
        );
        break;
      default:
        return Container();
    }
  }

  Widget _reserveButton() {
    return Container(
      height: SizeConfig.screenHeight * 0.055,
      child: FlatButton(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 20.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Reservation(),
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
                  "Reserve Now",
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
    );
  }


  Widget _topImage(){
    final topPosition = SizeConfig.safeBlockVertical * 3.5;
    final iconSize = 20.0;
    return Container(
      width: double.infinity,
      height: SizeConfig.blockSizeVertical * 32,
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: _restaurant.image,
            ),
          ),
          Positioned(
            top: topPosition,
            child: RawMaterialButton(
              onPressed: () => Navigator.pop(context),
              elevation: 2.0,
              fillColor: Colors.white,
              child: Icon(
                Icons.arrow_back_ios,
                size: iconSize,
              ),
              shape: CircleBorder(),
            ),
          ),
          Positioned(
            top: topPosition,
            right: 50,
            child: RawMaterialButton(
              onPressed: () {
                //TODO: navigator pop
              },
              elevation: 2.0,
              fillColor: Colors.white,
              child: Icon(
                Icons.share,
                size: iconSize,
              ),
              shape: CircleBorder(),
            ),
          ),
          Positioned(
            top: topPosition,
            right: 3,
            child: RawMaterialButton(
              onPressed: () {
                //TODO: navigator pop
              },
              elevation: 2.0,
              fillColor: Colors.white,
              child: Icon(
                Icons.favorite_border,
                size: iconSize,
              ),
              shape: CircleBorder(),
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

     final unselectedLabelColor = Color(0xFF000000);
    final indicatorColor = Color(0xFFDF8B37);
    final labelColor = indicatorColor;
    final tabTextStyle = Theme.of(context).textTheme.headline6.copyWith(
      fontWeight: FontWeight.w700,fontFamily: _fontName
    );
    return  Column(
      children: <Widget>[
        TabBar(
          controller: _mainTabController,
          labelColor: labelColor,
          labelStyle: tabTextStyle,
          unselectedLabelStyle: tabTextStyle,
          indicatorColor: indicatorColor,
          unselectedLabelColor: unselectedLabelColor,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: _tabs,
          onTap: (index){
            setState(() {
              _tabIndex = index;
            });
          },
        ),
        Container(
          child: [
            _firstTabView(),
            _secondTabView(),
            _thirdTabView(),
          ][_tabIndex],
        ),
      ],
    );
  }
  Widget _firstTabView(){
    final textTheme = Theme.of(context).textTheme;
    final restaurantMenuList =_restaurant.restaurantMenuList;
    final menuTextSize = SizeConfig.blockSizeHorizontal * 3.7;
    final normalTextTheme = textTheme.headline6.copyWith(fontWeight: FontWeight.normal,fontSize: SizeConfig.blockSizeHorizontal * 4);
    final headlineTextTheme = normalTextTheme.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 6,fontWeight: FontWeight.w900,color: Color(0xFF014895),fontFamily: _fontName);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(_restaurant.menuText,style: normalTextTheme,),
          SizedBox(height: SizeConfig.blockSizeVertical,),
          Container(
            height: menuTextSize * 2.5,
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
                      final selectedStyle = normalTextTheme.copyWith(fontSize: menuTextSize,color: Colors.white,fontFamily: _fontName);
                      final unselectedStyle = selectedStyle.copyWith(fontSize: menuTextSize,color: Color(0xFF8F9199));
                      final style = _selectedMenuIndex == index ? selectedStyle:unselectedStyle;
                      final child = GestureDetector(
                          onTap: (){
                            setState(() {
                              _selectedMenuIndex = index;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                              child: Text(menu.menuName,style: style,)));
                      if(_selectedMenuIndex == index){
                        return Card(
                          color: Colors.black,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10,0,10,0),
                            child: child,
                          ),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.only(left: 12,right: 12),
                        child: child,
                      );
                    },
                  ),
                ),
                SizedBox(width: SizeConfig.blockSizeHorizontal *1.5,),
                Text("${_restaurant.restaurantMenuList[_selectedMenuIndex].offer.toStringAsFixed(0)}%",style: textTheme.headline6.copyWith(color: Color(0xFFDF8B37),fontFamily: _fontName),)
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
              final textStyle = normalTextTheme.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 3.7,fontWeight: FontWeight.normal);
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
          Text("Special Conditions",style: headlineTextTheme,),
          SizedBox(height: SizeConfig.blockSizeVertical,),
          Text(_restaurant.specialCondition,style: normalTextTheme,),
        ],
      ),
    );
  }
  Widget _secondTabView(){
    final textTheme = Theme.of(context).textTheme;
    final normalTextSize =SizeConfig.blockSizeHorizontal * 4;
    final normalTextTheme = textTheme.headline6.copyWith(fontWeight: FontWeight.normal,fontSize: normalTextSize);
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
    final normalTextTheme = textTheme.headline6.copyWith(fontWeight: FontWeight.normal,fontSize: normalTextSize);
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
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: 150,
        itemBuilder: (BuildContext context, int index) =>_reviewItem(
          name: "ABC",
          profile: "https://images.generated.photos/D2VZmG6nKcw2YzJu0XmcGFEiO060xLV_es5yYU2YEkY/rs:fit:256:256/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zL3Yz/XzAwODEwOTcuanBn.jpg",
          rate: "This was our first stop of our 12 day holiday in Sri Lanka. We had a lovely warm welcome from hotel reception staff. The hotel is in an ideal location near to the sea shore and promenade where in the evening there is a good selection of street food stalls. The breakfast buffet was an amazing sight the largest display I have ever seen, wonderful choice of everything you could wish to have. "
        ),
      ),
    );
  }
  Widget _reviewItem({String profile, String rate, String name}){
    final radius = BorderRadius.circular(50);
    final textStyle = Theme.of(context).textTheme.headline6.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 4,fontWeight: FontWeight.w700);
    return Container(
      padding: EdgeInsets.only(top: 5,bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: CircleAvatar(
              child: ClipRRect(
                borderRadius: radius,
                  child: Image.network(profile)),
            ),
          ),
          SizedBox(width: SizeConfig.blockSizeHorizontal *3,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(name,style: textStyle,),
                Text(rate,style: textStyle.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 3.7,fontWeight: FontWeight.normal),),
              ],
            ),
          )
        ],
      ),
    );
  }

}
enum _TextField{Date,Guests,Voucher}