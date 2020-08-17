import 'package:offpeak/models/restaurant.dart';

class HotelDetails {
  String image =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/800px-Good_Food_Display_-_NCI_Visuals_Online.jpg";
  String name = "Test Resturant @ Colombo";
  double ratings = 5.0;
  int voteCount = 48;
  String promotion = "Colombo 1 Rs 1000 for 2";
  String menuText =
      "Promotion cannot be applied with any other in-house promotions. Please refer to the special condition below for more details";
  String noteOne = "Breakfast - Sri Lankan Breakfast (Ala Carte) Lunch - International Buffet, Chinese Restaurant Dinner - BBQ Night can be arranged, Sri Lankan Buffet, might vary with the day";
  String noteTwo = "";
  String specialCondition =
      "Promotions cannot be applied with any other in-house promotions. Please refer to the special condition bellow for details. Promotions cannot be applied with any other in-house promotions. Please refer to the special condition bellow for details.";

  String about =
      "The Test Resturant is one of the most reputed restaurant in Sri Lanka. Test is Chinese restaurant and there are any many other dine-in restaurants as well. This is must visit restaurant in our hotel. Test is one of the most reputed restaurant in Sri Lanka. Test Resturant is Chinese restaurant and there are any many other dine-in restaurants as well. This is must visit restaurant in our hotel. ";
  List<String> atmospheres = ['Family', 'Friends', 'Large Parties'];
  List<String> facilities = ['WiFi', "Air Conditioning"];
  List<String> payment = ['Cash', 'MasterCard', 'Frimi', 'VISA'];
  List<String> amenities = [
    "Pool",
    "Gymnasium",
    "Iron",
    "Washing Machine",
    "Air Conditioners (AC)"
  ];
  List<String> houseRules = [
  "Check in : 12.00 p.m.",
  "Checkout : 2.00pm",
  "If room only Check-in 9.00pm, Check out 10.00 a.m.",
  "Pets are allowed"
  ];
  List<OpeningHours> openingHours = [
    OpeningHours(day: "Sunday", openAt: "08.00", closeAt: "08.00"),
    OpeningHours(day: "Monday", openAt: "08.00", closeAt: "08.00"),
    OpeningHours(day: "Tuesday", openAt: "08.00", closeAt: "08.00"),
    OpeningHours(day: "Wednesday", openAt: "08.00", closeAt: "08.00"),
    OpeningHours(day: "Thursday", openAt: "08.00", closeAt: "08.00"),
    OpeningHours(day: "Friday", openAt: "08.00", closeAt: "08.00"),
    OpeningHours(day: "Saturday", openAt: "08.00", closeAt: "08.00"),
  ];
  List<Promotion> promotionList = [
    Promotion(time: "21 Jul", percentage: "10%"),
    Promotion(time: "22 Jul", percentage: "20%"),
    Promotion(time: "23 Jul", percentage: "30%"),
    Promotion(time: "24 Jul", percentage: "40%"),
    Promotion(time: "25 Jul", percentage: "10%"),
    Promotion(time: "26 Jul", percentage: "20%"),
    Promotion(time: "27 Jul", percentage: "30%"),
    Promotion(time: "28 Jul", percentage: "40%"),
  ];
  List<HotelRoom> hotelRooms = [
    HotelRoom(title: "Deluxe Double Room"),
    HotelRoom(title: "Deluxe Double Room 1"),
    HotelRoom(title: "Deluxe Double Room 2"),
    HotelRoom(title: "Deluxe Double Room 3"),
  ];
}

class HotelRoom{
  String title;
  String details = "Facing the Sea, Sea-View, Lots of other options available in the deluxe suites";
  String image = "https://r-cf.bstatic.com/images/hotel/max1024x768/242/242246894.jpg";

  HotelRoom({
    this.title,
  });

  List<String> availableDates = [
    "10 Aug",
    "11 Aug",
    "12 Aug",
    "13 Aug",
    "14 Aug",
    "15 Aug",
    "16 Aug",
    "17 Aug",
    "18 Aug",
    "19 Aug",
    "20 Aug",
  ];
  List<RoomPromotion> roomPromotion = [
    RoomPromotion(name: "Room Only",price: 800,percentage: 0),
    RoomPromotion(name: "Bed & Breakfast",price: 800,percentage: 10),
    RoomPromotion(name: "Half Board",price: 800,percentage: 20),
    RoomPromotion(name: "Full Board",price: 800,percentage: 25),
  ];
}
class RoomPromotion{
  String name;
  double price;
  double percentage;

  RoomPromotion({
    this.name,
    this.price,
    this.percentage,
  });
}