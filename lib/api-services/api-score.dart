import 'package:http/http.dart' as http;
import 'dart:convert';


class ApiScoreService {
  static const String baseUrl = 'http://192.168.100.5:8105/api/v1';
  /*static const String baseUrl = 'https://api-erentcar.azurewebsites.net/api/v1';*/


  Future<bool> scoreToClient(int clientId,int ownerId,String comment, double score) async {

    final Uri url = Uri.parse('$baseUrl/scores/scoreClient/client/$clientId/owner/$ownerId');

    final Map<String, dynamic> requestBody = {
      'comment': comment,
      'score': score
    };

    final http.Response response = await http.post(
        url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      print('score client se creó correctamente');
      return true;
    } else {
      print('Error al crear score client: ${response.statusCode}');
      return false;
    }
  }

  Future<bool> scoreToOwner(int ownerId,int clientId,String comment, double score) async {

    final Uri url = Uri.parse('$baseUrl/scores/scoreOwner/owner/$ownerId/client/$clientId');

    final Map<String, dynamic> requestBody = {
      'comment': comment,
      'score': score
    };

    final http.Response response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      print('score owner se creó correctamente');
      return true;
    } else {
      print('Error al crear score owner: ${response.statusCode}');
      return false;
    }
  }

  Future<bool> scoreToCar(int carId,int clientId,int rentId,String comment, double score) async {

    final Uri url = Uri.parse('$baseUrl/scores/scoreCar/car/$carId/client/$clientId/rent/$rentId');

    final Map<String, dynamic> requestBody = {
      'comment': comment,
      'score': score
    };

    final http.Response response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      print('score rent se creó correctamente');
      return true;
    } else {
      print('Error al crear score rent: ${response.statusCode}');
      return false;
    }
  }
}