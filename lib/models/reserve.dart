class Reserve {
  String title;
  String date;
  String time;
  String discount;
  String people;
  String location;

  Reserve(this.title, this.date, this.time, this.discount, this.people,
      this.location);
}


class ReserveHotel {
  String title;
  String duration;
  List<PackageDetails> selectedPackages = [];

  ReserveHotel(this.title, this.duration, this.selectedPackages);
}

class PackageDetails {
  String type;
  String options;
  int count;
  double price;
  double discountedPrice;

  PackageDetails(this.type, this.options, this.count, this.price, this.discountedPrice);
}