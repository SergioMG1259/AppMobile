import 'package:e_rent_car/models/reservation-owner.dart';

class RentOwner {
  int id;
  DateTime payDate;
  String state;
  ReservationOwner reservation;

  RentOwner({
    required this.id,
    required this.payDate,
    required this.state,
    required this.reservation,
  });

  factory RentOwner.fromJson(Map<String, dynamic> json) {
    return RentOwner(
      id: json['id'],
      payDate: DateTime.parse(json['payDate']),
      state: json['state'],
      reservation: ReservationOwner.fromJson(json['reservation']),
    );
  }
}