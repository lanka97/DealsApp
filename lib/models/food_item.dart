class FoodItem {
  final int id;
  final String image;
  final String name;
  final String description;
  final double price;
  final discount;
  final String category;
  final bool isTopPick;

  FoodItem(
      {this.id,
      this.image,
      this.name,
      this.description,
      this.price,
      this.discount,
      this.category,
      this.isTopPick});
}

class AddOn {
  String addon;
  int price;

  AddOn({this.addon, this.price});
}

class Order {
  int orderId;
  List<OrderItem> items = [];
  bool orderConfirmed = false;

  clear() {
    orderId = null;
    items = [];
    orderConfirmed = false;
  }

  static Order order = new Order();
}

class OrderItem {
  int itemId;
  String itemName;
  int quantity;
  int price;
  List<AddOn> selectedAddons = [];
  String note;
  String variance;
}

class User {
  String firstName;
  String lastName;
  int phoneNo;
  bool loggedIn;

  static User user = new User();
}
