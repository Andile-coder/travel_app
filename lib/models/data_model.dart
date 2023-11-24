class DataModel {
  String name;
  String img;
  String description;
  String location;
  int price;
  int stars;
  int people;
  DataModel({
    required this.name,
    required this.img,
    required this.description,
    required this.location,
    required this.price,
    required this.stars,
    required this.people,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json["name"],
      img: json["img"],
      description: json["description"],
      location: json["location"],
      price: json["price"],
      stars: json["stars"],
      people: json["people"],
    );
  }
}
