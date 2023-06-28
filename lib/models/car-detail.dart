import 'package:e_rent_car/models/user-short.dart';

class CarDetail {
  int? id;
  String? brand;
  String? model;
  String? type;
  int? seats;
  int? year;
  String? plateNumber;
  double? mileage;
  String? fuel;
  String? gearBox;
  double? pricePerDay;
  String? description;
  double? score;
  String? state;
  String? image;
  List<Location>? locations;
  UserShort? user;
  List<ScoreCar>? scoresCar;

  CarDetail({
    this.id,
    this.brand,
    this.model,
    this.type,
    this.seats,
    this.year,
    this.plateNumber,
    this.mileage,
    this.fuel,
    this.gearBox,
    this.pricePerDay,
    this.description,
    this.score,
    this.state,
    this.image,
    this.locations,
    this.user,
    this.scoresCar,
  });

  factory CarDetail.fromJson(Map<String, dynamic> json) {
    return CarDetail(
      id: json['id'],
      brand: json['brand'],
      model: json['model'],
      type: json['type'],
      seats: json['seats'],
      year: json['year'],
      plateNumber: json['plateNumber'],
      mileage: json['mileage'],
      fuel: json['fuel'],
      gearBox: json['gearBox'],
      pricePerDay: json['pricePerDay'],
      description: json['description'],
      score: json['score'],
      state: json['state'],
      image: json['image'],
      locations: List<Location>.from(json['locations'].map((x) => Location.fromJson(x))),
      user: UserShort.fromJson(json['user']),
      scoresCar: List<ScoreCar>.from(json['scoresCar'].map((x) => ScoreCar.fromJson(x))),
    );
  }
}

class Location {
  String location;

  Location({
   required this.location,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      location: json['location'],
    );
  }
}

class ScoreCar {
  int id;
  String comment;
  double score;

  ScoreCar({
    required this.id,
    required this.comment,
    required this.score,
  });

  factory ScoreCar.fromJson(Map<String, dynamic> json) {
    return ScoreCar(
      id: json['id'],
      comment: json['comment'],
      score: json['score'],
    );
  }
}