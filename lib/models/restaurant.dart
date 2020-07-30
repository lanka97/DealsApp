class Restaurant{
  String image = "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/800px-Good_Food_Display_-_NCI_Visuals_Online.jpg";
  String name = "Yue Chuan@ The Kingsburry";
  double ratings = 5.0;
  int voteCount = 48;
  String promotion = "Colombo 1 Rs 1000 for 2";
  String menuText = "Promotion cannot be applied with any other in-house promotions. Please refer to the special condition below for more details";
  String noteOne = "*Menu and pricing subject to change without notice";
  String noteTwo = "** All prices are exclusive of VAT and service charge unless otherwise indicate under special condition";
  String specialCondition = "Promotions cannot be applied with any other in-house promotions. Please refer to the special condition bellow for details. Promotions cannot be applied with any other in-house promotions. Please refer to the special condition bellow for details.";

  String about = "The Kingsburry is one of the most reputed restaurant in Sri Lanka. Yue Chuan is Chinese restaurant and there are any many other dine-in restaurants as well. This is must visit restaurant in our hotel. The Kingsburry is one of the most reputed restaurant in Sri Lanka. Yue Chuan is Chinese restaurant and there are any many other dine-in restaurants as well. This is must visit restaurant in our hotel. ";
  List<String> atmospheres = ['Family','Friends','Large Parties'];
  List<String> facilities = ['WiFi',"Air Conditioning"];
  List<String> payment = ['Cash', 'MasterCard','Frimi','VISA'];
  List<OpeningHours> openingHours = [
    OpeningHours(day: "Sunday",openAt: "08.00",closeAt: "08.00"),
    OpeningHours(day: "Monday",openAt: "08.00",closeAt: "08.00"),
    OpeningHours(day: "Tuesday",openAt: "08.00",closeAt: "08.00"),
    OpeningHours(day: "Wednesday",openAt: "08.00",closeAt: "08.00"),
    OpeningHours(day: "Thursday",openAt: "08.00",closeAt: "08.00"),
    OpeningHours(day: "Friday",openAt: "08.00",closeAt: "08.00"),
    OpeningHours(day: "Saturday",openAt: "08.00",closeAt: "08.00"),
  ];


  List<String> categories = ["Chinese","Thai","Italian"];
  List<Promotion> promotionList = [
    Promotion(time: "10:30",percentage: "20 %"),
    Promotion(time: "10:30",percentage: "20 %"),
    Promotion(time: "10:30",percentage: "20 %"),
    Promotion(time: "10:30",percentage: "20 %"),
    Promotion(time: "10:30",percentage: "20 %"),
  ];
  List<RestaurantMenu> restaurantMenuList = [
    RestaurantMenu(
      menuName: "Top picks",
      offer: 20,
      restaurantMenuItems: [
        RestaurantMenuItem(name: "Chicken Submarine",price: 1000),
        RestaurantMenuItem(name: "Chicken Fried Rice",price: 1000),
        RestaurantMenuItem(name: "Seafood Fried Rice",price: 1000),
        RestaurantMenuItem(name: "Mixed Fried Rice",price: 1000),
        RestaurantMenuItem(name: "Chicken Koththu",price: 1000),
      ],
    ),
    RestaurantMenu(
      menuName: "Burgers",
      offer: 20,
      restaurantMenuItems: [
        RestaurantMenuItem(name: "Chicken Submarine a",price: 1000),
        RestaurantMenuItem(name: "Chicken Fried Rice a",price: 1000),
        RestaurantMenuItem(name: "Seafood Fried Rice a",price: 1000),
        RestaurantMenuItem(name: "Mixed Fried Rice a",price: 1000),
        RestaurantMenuItem(name: "Chicken Koththu a",price: 1000),
      ],
    ),
    RestaurantMenu(
      menuName: "Burgers B",
      offer: 20,
      restaurantMenuItems: [
        RestaurantMenuItem(name: "Chicken Submarine b",price: 1000),
        RestaurantMenuItem(name: "Chicken Fried Rice b",price: 1000),
        RestaurantMenuItem(name: "Seafood Fried Rice b",price: 1000),
        RestaurantMenuItem(name: "Mixed Fried Rice b",price: 1000),
        RestaurantMenuItem(name: "Chicken Koththu b",price: 1000),
      ],
    ),
    RestaurantMenu(
      menuName: "Burgers C",
      offer: 20,
      restaurantMenuItems: [
        RestaurantMenuItem(name: "Chicken Submarine c",price: 1000),
        RestaurantMenuItem(name: "Chicken Fried Rice c",price: 1000),
        RestaurantMenuItem(name: "Seafood Fried Rice c",price: 1000),
        RestaurantMenuItem(name: "Mixed Fried Rice c",price: 1000),
        RestaurantMenuItem(name: "Chicken Koththu c",price: 1000),
      ],
    ),
    RestaurantMenu(
      menuName: "Burgers D",
      offer: 20,
      restaurantMenuItems: [
        RestaurantMenuItem(name: "Chicken Submarine d",price: 1000),
        RestaurantMenuItem(name: "Chicken Fried Rice d",price: 1000),
        RestaurantMenuItem(name: "Seafood Fried Rice d",price: 1000),
        RestaurantMenuItem(name: "Mixed Fried Rice d",price: 1000),
        RestaurantMenuItem(name: "Chicken Koththu d",price: 1000),
      ],
    ),
  ];
}

class Promotion{
  String time;
  String percentage;

  Promotion({
     this.time,
     this.percentage,
  });
}

class RestaurantMenu{
  String menuName;
  double offer;
  List<RestaurantMenuItem> restaurantMenuItems;

  RestaurantMenu({
    this.menuName,
    this.offer,
    this.restaurantMenuItems,
  });
}

class RestaurantMenuItem{
  String name;
  double price;
  RestaurantMenuItem({this.name, this.price});
}

class OpeningHours{
  String day;
  String openAt;
  String closeAt;

  OpeningHours({this.day, this.openAt, this.closeAt});
}
class RestuarntCard{
  String img;
  String price;
  String name;
  String address;
  String verity;
  double rating;
  int rateCount;

  Restaurant(this.img, this.price, this.name, this.address, this.verity,
      this.rating, this.rateCount);
}
