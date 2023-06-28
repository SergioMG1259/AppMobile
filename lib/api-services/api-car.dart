import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/car.dart';
import '../models/car-detail.dart';

class ApiCarService {
  /*static const String baseUrl = 'http://192.168.100.5:8105/api/v1';*/
  static const String baseUrl = 'https://api-erentcar.azurewebsites.net/api/v1';

  Future<List<Car>> getCars() async {
    final url = Uri.parse('$baseUrl/cars');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData is List) {
        return responseData.map((carJson) => Car.fromJson(carJson)).toList();
      }
    }

    throw Exception('Error en la solicitud');
  }

  Future<List<Car>> getCarsOwner(int ownerId) async {
    final url = Uri.parse('$baseUrl/cars/my-cars/$ownerId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData is List) {
        return responseData.map((carJson) => Car.fromJson(carJson)).toList();
      }
    }

    throw Exception('Error en la solicitud');
  }

  Future<CarDetail> getCarDetail(int carId) async {
    final url = Uri.parse('$baseUrl/cars/car-detail/$carId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final CarDetail car = CarDetail.fromJson(responseData);
      return car;
    } else {
      throw Exception('Error en la solicitud');
    }
  }
  Future<bool> addCar(
      String brand,
      String model,
      String type,
      int seats,
      int year,
      String fuel,
      String gearBox,
      String plateNumber,
      String description,
      double mileage,
      double pricePerDay,
      String image,
      List<String> locations, int ownerId
      ) async {
    // Construir el cuerpo de la solicitud POST
    final body = jsonEncode({
      'brand': brand,
      'model': model,
      'type': type,
      'seats': seats,
      'year': year,
      'fuel': fuel,
      'gearBox': gearBox,
      'plateNumber': plateNumber,
      'description': description,
      'mileage': mileage,
      'pricePerDay': pricePerDay,
      'image': image,
      'locations': locations.map((location) => {'location': location}).toList(),
    });

    // Hacer la solicitud POST a tu API
    final response = await http.post(
      Uri.parse('$baseUrl/cars/register/owner/$ownerId'),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    // Verificar la respuesta de la API
    if (response.statusCode == 200) {
      // Éxito: El auto se agregó correctamente
      print('Auto agregado correctamente');
      return true;
    } else {
      print(response.body);
      print(body);
      // Error: La solicitud no tuvo éxito
      print('Error al agregar el auto: ${response.statusCode}');
      return false;
    }
  }

}




