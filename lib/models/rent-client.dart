import 'dart:ffi';

import 'package:e_rent_car/models/reservation-client.dart';

class RentClient {
  int id;
  DateTime payDate;
  String state;
  bool stateScore;
  ReservationClient reservation;

  RentClient({
    required this.id,
    required this.payDate,
    required this.state,
    required this.stateScore,
    required this.reservation,
  });

  factory RentClient.fromJson(Map<String, dynamic> json) {
    return RentClient(
      id: json['id'],
      payDate: DateTime.parse(json['payDate']),
      state: json['state'],
      stateScore: json['stateScore'],
      reservation: ReservationClient.fromJson(json['reservation']),
    );
  }
}