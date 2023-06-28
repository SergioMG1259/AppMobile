import 'package:e_rent_car/models/car.dart';
import 'package:e_rent_car/models/user-short.dart';

class ReservationOwner {
  final int id;
  final DateTime reserveDate;
  final DateTime returnDate;
  final double amount;
   String state;
  final String location;
  final Car car;
  final UserShort user;

  ReservationOwner({
    required this.id,
    required this.reserveDate,
    required this.returnDate,
    required this.amount,
    required this.state,
    required this.location,
    required this.car,
    required this.user
  });

  factory ReservationOwner.fromJson(Map<String, dynamic> json) {
    return ReservationOwner(
      id: json['id'],
      reserveDate: DateTime.parse(json['reserveDate']),
      returnDate: DateTime.parse(json['returnDate']),
      amount: json['amount'].toDouble(),
      state: json['state'],
      location: json['location'],
      car: Car.fromJson(json['car']),
      user: UserShort.fromJson(json['client'])
    );
  }
}