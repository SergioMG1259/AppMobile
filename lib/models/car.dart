import 'package:e_rent_car/models/user-short.dart';

class Car {
  final int id;
  final String brand;
  final String model;
  final String type;
  final int seats;
  final int year;
  final double mileage;
  final double pricePerDay;
  final String image;
  final double score;
  final String state;
  UserShort user;

  Car({
    required this.id,
    required this.brand,
    required this.model,
    required this.type,
    required this.seats,
    required this.year,
    required this.mileage,
    required this.pricePerDay,
    required this.image,
    required this.score,
    required this.state,
    required this.user
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      brand: json['brand'],
      model: json['model'],
      type: json['type'],
      seats: json['seats'],
      year: json['year'],
      mileage: json['mileage'].toDouble(),
      pricePerDay: json['pricePerDay'].toDouble(),
      image: json['image'],
      score: json['score'].toDouble(),
      state: json['state'],
      user: UserShort.fromJson(json['user'])
    );
  }
}