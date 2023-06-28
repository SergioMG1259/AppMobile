import 'package:e_rent_car/models/reservation-owner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/reservation-client.dart';

class ApiReservationService {
  /*static const String baseUrl = 'http://192.168.100.5:8105/api/v1';*/
  static const String baseUrl = 'https://api-erentcar.azurewebsites.net/api/v1';

  Future<List<ReservationClient>> getReservationsClient(int id) async {
    final url = Uri.parse('$baseUrl/reservations/client/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData is List) {
        return responseData.map((carJson) => ReservationClient.fromJson(carJson)).toList();
      }
    }
    throw Exception('Error en la solicitud');
  }
  Future<List<ReservationOwner>> getReservationsOwner(int id) async {
    final url = Uri.parse('$baseUrl/reservations/owner/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData is List) {
        return responseData.map((carJson) => ReservationOwner.fromJson(carJson)).toList();
      }
    }
    throw Exception('Error en la solicitud');
  }

  Future<bool> createReservation(String location,String date1,String date2,double amount,int ownerId,int clientId,int carId) async {
    final Map<String, dynamic> requestBody = {
      'location': location,
      'reserveDate': date1,
      'returnDate': date2,
      'amount': amount,
    };

    final Uri url = Uri.parse('$baseUrl/reservations/register/owner/$ownerId/client/$clientId/car/$carId');

    final http.Response response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      print('La reserva se creó correctamente');
      return true;
    } else {
      print('Error al crear la reserva: ${response.statusCode}');
      return false;
    }
  }

  Future<bool> acceptReservation(int reservationId) async {

    final Uri url = Uri.parse('$baseUrl/reservations/accept/reservation/$reservationId');

    final http.Response response = await http.put(
      url
    );

    if (response.statusCode == 200) {
      print('La reserva se creó correctamente');
      return true;
    } else {
      print('Error al crear la reserva: ${response.statusCode}');
      return false;
    }
  }
  Future<bool> declineReservation(int reservationId) async {

    final Uri url = Uri.parse('$baseUrl/reservations/decline/reservation/$reservationId');

    final http.Response response = await http.put(
        url
    );

    if (response.statusCode == 200) {
      print('La reserva se creó correctamente');
      return true;
    } else {
      print('Error al crear la reserva: ${response.statusCode}');
      return false;
    }
  }
}