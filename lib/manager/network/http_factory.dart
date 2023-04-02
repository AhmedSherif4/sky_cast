import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpFactory {
  HttpFactory();

  final String _baseUrl = 'https://api.openweathermap.org/data/2.5';
  final String _apiKey = '51d3e54ca50a6899c4be4c479d513889';

  Future<Map<String, dynamic>> getData(String pathUrl) async {
    try {
      final response =
          await http.get(Uri.parse('$_baseUrl/$pathUrl&appid=$_apiKey'));
      final result = json.decode(response.body) as Map<String, dynamic>;
      return result;
    } catch (error) {
      throw Exception();
    }
  }
}
