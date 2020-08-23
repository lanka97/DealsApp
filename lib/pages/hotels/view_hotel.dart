import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:offpeak/models/hotel_details.dart';
import 'package:offpeak/models/restaurant.dart';
import 'package:offpeak/pages/reservation.dart';
import 'package:offpeak/utils/size_config.dart';

class ViewHotel extends StatefulWidget {
  static const routeName = "view_hotel";
  @override
  _ViewHotelState createState() => _ViewHotelState();
}

class _ViewHotelState extends State<ViewHotel> with SingleTickerProviderStateMixin{
  HotelDetails _hotel;
  TabController _mainTabController ;
  int _tabIndex;
  static const _fontName = "HelveticaNeu";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<String> _selectedDates = List();
  RoomPromotion _selectedAccommodationType;
  int _selectedRooms = 1;
  HotelRoom _selectedRoomType;
  bool _canShowBottomSheet = true;
  @override
  void initState() {
    super.initState();
    _hotel = HotelDetails();
    _tabIndex = 0;
    _mainTabController = TabController(length: 3, vsync: this,);
  }
  @override
  void dispose() {
    _mainTabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.headline6.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 4.5);
    final double price = _selectedAccommodationType?.price??0;
    final double discount = _selectedAccommodationType?.percentage??0;
    final totalPrice = price *(1 -  discount /100);
    final totalStyle = titleStyle.copyWith(color: Color(0xFFED6D2D),fontSize: SizeConfig.blockSizeHorizontal * 4.5);
    final priceStyle = titleStyle.copyWith(color: Color(0xFF8A98BA),fontSize: SizeConfig.blockSizeHorizontal * 3.5,decoration: TextDecoration.lineThrough);

    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: <Widget>[
          Expanded(child: SingleChildScrollView(child: _buildBody())),
          _selectedRoomType != null && _canShowBottomSheet?
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockVertical * 3,vertical: SizeConfig.blockSizeHorizontal * 2),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("$_selectedRooms Rooms| ${_selectedDates.length} Nights",style: titleStyle,),
                          Row(
                            children: <Widget>[
                              Text("Rs. $totalPrice",style: totalStyle,),
                              Text("Rs. $price",style: priceStyle,),
                            ],
                          ),
                          Text("Edit",style: priceStyle.copyWith(decoration: TextDecoration.underline,color: Color(0xFF014895)),),
                        ],
                      ),
                    ),
                    RaisedButton(
                      color: Color(0xFFCC070B),
                      onPressed: ()=>_showReserve(),
                      textColor: Colors.white,
                      child: Text("Reserve"),
                    )
                  ],
                ),
              )
            ],
          ):Container()
        ],
      ),
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
              Expanded(child: Text(_hotel.name,style: textTheme.headline6.copyWith(fontWeight: FontWeight.w900, color: Color(0xFF000000), fontSize: SizeConfig.blockSizeHorizontal * 5.5, fontFamily: _fontName),)),
            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical,),
          Row(
            children: <Widget>[
              Expanded(child: Text(
    'Colombo 1',
    style: textTheme.headline4.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 4,color: Color(0xFF000000)),
              ),),
              //Expanded(child: Text(_restaurant.promotion,style: textTheme.headline4.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 4,fontWeight: FontWeight.bold,color:blueGrey),)),
              Icon(Icons.star,color: Color(0xFFCC070B),),
              Text("${_hotel.ratings}",style: TextStyle(color: darkBlue,fontFamily: _fontName)),
              Text("(${_hotel.voteCount})",style: TextStyle(color: blueGrey,fontFamily: _fontName),),
            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical * 0.5,),
          Container(
            height: SizeConfig.blockSizeHorizontal * 13,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _hotel.promotionList.length,
                itemBuilder: (BuildContext context, int index) => _promotionListItem(_hotel.promotionList[index], textTheme, redColor)
            ),
          ),
          Container(
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: _hotel.hotelRooms.length,
                itemBuilder: (BuildContext context, int index) => _roomItem(_hotel.hotelRooms[index])
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
              imageUrl: _hotel.image,
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
    final menuTextSize = SizeConfig.blockSizeHorizontal * 3.7;
    final normalTextTheme = textTheme.headline6.copyWith(fontWeight: FontWeight.normal,fontSize: SizeConfig.blockSizeHorizontal * 4);
    final headlineTextTheme = normalTextTheme.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 6,fontWeight: FontWeight.w900,color: Color(0xFF014895),fontFamily: _fontName);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: SizeConfig.blockSizeVertical,),
          Text(_hotel.menuText,style: normalTextTheme,),
          SizedBox(height: SizeConfig.blockSizeVertical,),
          Text(_hotel.noteOne,style: normalTextTheme,),
          SizedBox(height: SizeConfig.blockSizeVertical,),
          Text(_hotel.noteTwo,style: normalTextTheme,),
          SizedBox(height: SizeConfig.blockSizeVertical,),
          Text("Amenities",style: headlineTextTheme,),
          SizedBox(height: SizeConfig.blockSizeVertical,),
          ListView.builder(
            itemCount: _hotel.amenities.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => Text(_hotel.amenities[index],style: normalTextTheme,),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical,),
          Text("House Rules",style: headlineTextTheme,),
          SizedBox(height: SizeConfig.blockSizeVertical,),
          ListView.builder(
            itemCount: _hotel.houseRules.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => Text(_hotel.houseRules[index],style: normalTextTheme,),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical,),
          Text("Special Conditions",style: headlineTextTheme,),
          SizedBox(height: SizeConfig.blockSizeVertical,),
          Text(_hotel.specialCondition,style: normalTextTheme,),

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
          Text(_hotel.about,style: normalTextTheme,),
          SizedBox(height: SizeConfig.blockSizeVertical * 2,),
          _topTextRowAbout("Atmosphere", _hotel.atmospheres),
          _topTextRowAbout("Facilities", _hotel.facilities),
          _topTextRowAbout("Payment", _hotel.payment),
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
            itemCount: _hotel.openingHours.length, itemBuilder: (BuildContext context, int index) {
            final day = _hotel.openingHours[index];
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

  Widget _roomItem(HotelRoom hotelRoom) {
    final textTheme = Theme.of(context).textTheme;
    final redColor = Color(0xFFCC070B);
    final orangeColor = Color(0xFFF57C3F);
    final buttonTextStyle = textTheme.headline6.copyWith(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal * 3.9);
    final selected = hotelRoom.title == _selectedRoomType?.title;

    return Container(
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: SizeConfig.blockSizeHorizontal * 20,
                child: CachedNetworkImage(
                  imageUrl: hotelRoom.image,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: SizeConfig.blockSizeHorizontal * 2,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(hotelRoom.title,style: textTheme.headline6.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 4.5,fontWeight: FontWeight.bold),),
                    Text(hotelRoom.details,style: textTheme.bodyText2.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 3.8),),
                  ],
                ),
              )
            ],
          ),
          ListView.builder(
          physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.zero,
    shrinkWrap: true,
            itemCount: hotelRoom.roomPromotion.length,
             itemBuilder: (BuildContext context, int index) => _roomPromotion(hotelRoom.roomPromotion[index]),
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: selected?null:(){
                if(_selectedRoomType == null){
                  setState(() {
                    _selectedAccommodationType = null;
                    _selectedRooms = 1;
                    _selectedDates = List();
                  });
                  _onSelectRoom(hotelRoom);
                }
              },
              color: redColor,
              disabledColor: orangeColor,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(selected?"Selected ($_selectedRooms)":"Choose",style: buttonTextStyle,),
            ),
          ),
        ],
      ),
    );
  }

  Widget _roomPromotion(RoomPromotion promotion) {
    final orangeColor = Color(0xFFF57C3F);
    final canShowPromotion = promotion.percentage != 0;
    final originalPrice = promotion.price;
    final finalPrice = originalPrice - originalPrice * promotion.percentage / 100;
    final textTheme = Theme.of(context).textTheme;
    final nameStyle = textTheme.headline6.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 4.5,fontWeight: FontWeight.bold);
    final cardTextStyle = nameStyle.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 3.6,color: Colors.white);

    final originalPriceTextStyle = canShowPromotion?
      nameStyle.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 3.0,color: Color(0xFF8A98BA),decoration: TextDecoration.lineThrough):
      nameStyle.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 3.8,color: Colors.black);

    final finalPriceTextStyle = nameStyle.copyWith(color: orangeColor,fontSize: SizeConfig.blockSizeHorizontal * 3.8);
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(flex:2,child: Text(promotion.name,style: nameStyle,)),
          canShowPromotion?Card(
            color: orangeColor,
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
            child: Text("${promotion.percentage}%",style: cardTextStyle,),
          )):Expanded(child: Container()),
          Expanded(flex: 1,child: Container(
              alignment: Alignment.centerRight,

              child: canShowPromotion?Column(
                children: <Widget>[
                  Text("Rs. $finalPrice",style: finalPriceTextStyle,),
                  Text("Rs. $originalPrice",style: originalPriceTextStyle,),
                ],
              ):Container(
                alignment: Alignment.centerRight,
                child:                   Text("Rs. $finalPrice",style: originalPriceTextStyle,),
              ))),
        ],
      ),
    );
  }
  void _bottomSheet({@required Widget child,@required Widget title,double iconSize}){

//    _scaffoldKey.currentState.
    showModalBottomSheet(context:context,builder:(context) => Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10,bottom: 10,top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              title,
              Spacer(),
              RawMaterialButton(
                onPressed: ()=>Navigator.pop(context),
                child: Icon(Icons.close),
                splashColor: Colors.transparent,
              )
            ],
          ),
          child
        ],
      ),
    ));
  }
  _onSelectRoom(HotelRoom hotelRoom) {
    final iconSize = SizeConfig.blockSizeHorizontal * 4.5;
    final titleStyle = Theme.of(context).textTheme.headline6.copyWith(fontSize: iconSize);
    final secondaryStyle = Theme.of(context).textTheme.headline6.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 3.5,color: Colors.white);
    final selectedColor = Color(0xFFF57C3F);
    final unselectedColor = Color(0xFFCC070B);
    final border = BorderSide(color: Colors.black);

    _bottomSheet(
      title: Text("Choose the Dates",style: titleStyle,),
      iconSize: iconSize,
      child: StatefulBuilder(builder: (BuildContext context, StateSetter setStateBottom) {
        final double price = _selectedAccommodationType?.price??0;
        final double discount = _selectedAccommodationType?.percentage??0;
        final totalPrice = price *(1 -  discount /100);
        final totalStyle = titleStyle.copyWith(color: selectedColor,fontSize: iconSize * 1.2);
        final priceStyle = secondaryStyle.copyWith(color: Color(0xFF8A98BA),decoration: TextDecoration.lineThrough);
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: SizeConfig.blockSizeHorizontal * 14,
              alignment: Alignment.center,
              child: ListView.builder(
                itemCount: hotelRoom.availableDates.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final text = hotelRoom.availableDates[index];
                  final selected = _selectedDates.contains(text);
                  return InkWell(
                    onTap: (){
                      setStateBottom(() {
                        if(selected){
                          _selectedDates.remove(text);
                        }else{
                          _selectedDates.add(text);
                        }                      });
                    },
                    child: Card(
                      color: selected?selectedColor:unselectedColor,
                      child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(text,style: secondaryStyle,)),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeHorizontal * 2,),
            Text("No. of Rooms",style: titleStyle,),
            SizedBox(height: SizeConfig.blockSizeHorizontal * 2,),
            Container(
              child: Row(
                children: <Widget>[
                  Spacer(),
                  RawMaterialButton(
                    onPressed: () {
                      if(_selectedRooms != 0){
                        setStateBottom(() {
                          --_selectedRooms;
                        });
                      }
                    },
                    splashColor: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border(
                          top: border,
                          bottom: border,
                          left: border,
                          right: border,
                        )
                      ),
                        child: Icon(Icons.remove,size: iconSize,)),
                  ),
                  Text(_selectedRooms.toString()),
                  RawMaterialButton(
                    onPressed: () {
                        setStateBottom(() {
                          ++_selectedRooms;
                        });

                    },
                    splashColor: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border(
                          top: border,
                          bottom: border,
                          left: border,
                          right: border,
                        )
                      ),
                        child: Icon(Icons.add,size: iconSize,)),
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeHorizontal * 2,),
            Text("Accommodation Type",style: titleStyle,),
            SizedBox(height: SizeConfig.blockSizeHorizontal * 2,),
            Container(
              height: SizeConfig.blockSizeHorizontal * 14,
              alignment: Alignment.center,
              child: ListView.builder(
                itemCount: hotelRoom.roomPromotion.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final package = hotelRoom.roomPromotion[index];
                  final text = package.name;
                  final selected = _selectedAccommodationType == package;
                  return InkWell(
                    onTap: (){
                      setStateBottom(() {
                        _selectedAccommodationType = package;
                      });
                    },
                    child: Card(
                      color: selected?selectedColor:unselectedColor,
                      child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(text,style: secondaryStyle,)),
                    ),
                  );
                },
              ),
            ),
            Container(
              child: price <= 0?Container():Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                   Text("Rs. $totalPrice",style: totalStyle,),
                  SizedBox(width: SizeConfig.blockSizeHorizontal,),
                  price == totalPrice ? Container():Text("Rs. $price",style: priceStyle,),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeHorizontal,),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: RaisedButton(
                onPressed: _selectedAccommodationType == null || _selectedDates.length == 0?null:(){
                  setState(() {
                    _selectedRoomType = hotelRoom;
                  });
                  Navigator.pop(context);
                },
                color: unselectedColor,
                disabledColor: unselectedColor.withOpacity(0.6),
                child: Text("Add",style: secondaryStyle,),
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeHorizontal,),
          ],
        );
      },),
    );
  }

  _showReserve() {
//    setState(() {
//      _canShowBottomSheet = false;
//    });
    final iconSize = SizeConfig.blockSizeHorizontal * 4.5;
    final titleStyle = Theme.of(context).textTheme.headline6.copyWith(fontSize: iconSize);
    final secondaryStyle = Theme.of(context).textTheme.headline6.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 3.5,color: Colors.black);
    final selectedColor = Color(0xFFF57C3F);
    final unselectedColor = Color(0xFFCC070B);
    final border = BorderSide(color: Colors.black);
    final double price = _selectedAccommodationType?.price??0;
    final double discount = _selectedAccommodationType?.percentage??0;
    final totalPrice = price *(1 -  discount /100);
    final totalStyle = titleStyle.copyWith(color: Color(0xFFED6D2D),fontSize: SizeConfig.blockSizeHorizontal * 3.5);
    final priceStyle = titleStyle.copyWith(color: Color(0xFF8A98BA),fontSize: SizeConfig.blockSizeHorizontal * 3.0,decoration: TextDecoration.lineThrough);

    _bottomSheet(
      title: Text("Reservation Details",style: titleStyle,),
          iconSize: iconSize,
      child: Padding(
        padding: const EdgeInsets.only(left:8.0,bottom: 8,right: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(_selectedDates.first + " - " + _selectedDates.last,style: titleStyle,),
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(

                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(_selectedRoomType.title,style: secondaryStyle,),
                          Text(_selectedAccommodationType.name,style: secondaryStyle,),
                          Text("Edit",style: priceStyle.copyWith(decoration: TextDecoration.underline,color: Color(0xFF014895)),),

                        ],
                      ),
                      Spacer(),
                      Text(_selectedRooms.toString(),style: secondaryStyle,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text("Rs. $totalPrice",style: totalStyle,),
                            Text("Rs. $price",style: priceStyle,)
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Rs. 800",style: totalStyle.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 4.5),),
                      SizedBox(width: SizeConfig.blockSizeHorizontal,),
                      Text("Rs. 900",style: priceStyle.copyWith(fontSize: SizeConfig.blockSizeHorizontal * 4),),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("2 Rooms| 5 Guests| 1 Night",style: titleStyle.copyWith(color: Color(0xFF646464)),),
                          Text("View Reservation",style: secondaryStyle.copyWith(color: Color(0xFF014895,),decoration: TextDecoration.underline),),
                        ],
                      )),
                      RaisedButton(
                        onPressed: () {  },
                        color: unselectedColor,
                        textColor: Colors.white,
                        child: Text("Reserve"),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
