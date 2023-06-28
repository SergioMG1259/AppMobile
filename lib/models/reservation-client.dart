import 'package:e_rent_car/models/car.dart';

class ReservationClient {
  final int id;
  final DateTime reserveDate;
  final DateTime returnDate;
  final double amount;
   String state;
  final String location;
  final Car car;

  ReservationClient({
    required this.id,
    required this.reserveDate,
    required this.returnDate,
    required this.amount,
    required this.state,
    required this.location,
    required this.car,
  });

  factory ReservationClient.fromJson(Map<String, dynamic> json) {
    return ReservationClient(
      id: json['id'],
      reserveDate: DateTime.parse(json['reserveDate']),
      returnDate: DateTime.parse(json['returnDate']),
      amount: json['amount'].toDouble(),
      state: json['state'],
      location: json['location'],
      car: Car.fromJson(json['car']),
    );
  }
}