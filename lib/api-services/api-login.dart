import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginApiService {
  /*static const String baseUrl = 'http://192.168.100.5:8105/api/v1'*/

  static const String baseUrl = 'https://api-erentcar.azurewebsites.net/api/v1';

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/users/login/email/$email/password/$password');
    final response = await http.post(url);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception('Error en la solicitud');
    }
  }
}