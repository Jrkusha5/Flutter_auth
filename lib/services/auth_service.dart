import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';
import '../models/user_model.dart';

class AuthService {
  static Future<Map<String, dynamic>> register(User user) async {
    final url = Uri.parse("${AppUrl.baseUrl}/user/register");
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(user.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = json.decode(response.body);
        return {"success": true, "data": responseData};
      } else {
        return {"success": false, "error": json.decode(response.body)['message']};
      }
    } catch (e) {
      return {"success": false, "error": "An error occurred: $e"};
    }
  }

  static Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse("${AppUrl.baseUrl}/user/login");
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return {"success": true, "data": responseData};
      } else {
        final errorResponse = json.decode(response.body);
        return {"success": false, "error": errorResponse['message'] ?? 'Login failed'};
      }
    } catch (e) {
      return {"success": false, "error": "An error occurred: $e"};
    }
  }
}
