import 'package:e_rent_car/models/user-short.dart';
import 'package:e_rent_car/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiUserService {
  /*static const String baseUrl = 'http://192.168.100.5:8105/api/v1';*/ // Reemplaza con la URL base de tu API

  static const String baseUrl = 'https://api-erentcar.azurewebsites.net/api/v1';

  Future<User> getUser(int id) async {
    final url = Uri.parse('$baseUrl/users/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final User user = User.fromJson(responseData);
      return user;
    } else {
      throw Exception('Error en la solicitud');
    }
  }
}