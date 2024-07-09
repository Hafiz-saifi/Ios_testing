// services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model.dart';

class ApiService {
  static const String baseUrl = 'https://reqres.in/api';

  static Future<UserModel> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }
}
