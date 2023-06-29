import 'package:e_rent_car/models/rent-client.dart';
import 'package:e_rent_car/models/rent-owner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ApiRentService {
  static const String baseUrl = 'http://192.168.100.5:8105/api/v1';

  /*static const String baseUrl = 'https://api-erentcar.azurewebsites.net/api/v1';*/

  Future<List<RentClient>> getRentsClient(int id) async {
    final url = Uri.parse('$baseUrl/rents/client/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData is List) {
        return responseData.map((carJson) => RentClient.fromJson(carJson)).toList();
      }
    }
    throw Exception('Error en la solicitud');
  }

  Future<List<RentOwner>> getRentsOwner(int id) async {
    final url = Uri.parse('$baseUrl/rents/owner/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData is List) {
        return responseData.map((carJson) => RentOwner.fromJson(carJson)).toList();
      }
    }
    throw Exception('Error en la solicitud');
  }

  Future<bool> pay(int reservationId) async {

    final Uri url = Uri.parse('$baseUrl/rents/register/reservation/$reservationId');

    final http.Response response = await http.post(
        url
    );

    if (response.statusCode == 200) {
      print('La renta se creó correctamente');
      return true;
    } else {
      print('Error al crear la renta: ${response.statusCode}');
      return false;
    }
  }

  Future<bool> endRent(int rentId) async {

    final Uri url = Uri.parse('$baseUrl/rents/endRent/rent/$rentId');

    final http.Response response = await http.put(
        url
    );

    if (response.statusCode == 200) {
      print('la renta termino');
      return true;
    } else {
      print('Error al terminar la renta: ${response.statusCode}');
      return false;
    }
  }
}