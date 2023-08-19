import 'dart:convert';
import 'package:api_auth/controllers/shared_preference.controller.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  Future<void> registerUser(Map<String, dynamic> userData, context) async {
    final response = await http.post(
        Uri.parse('https://fakestoreapi.com/users'),
        body: jsonEncode(userData));
    if (response.statusCode == 201) {
      print("Registered Successfully");
    } else {
      print("while register error");
    }
  }

  Future<bool> loginUser(userData, context) async {
    final response = await http.post(
      Uri.parse("https://fakestoreapi.com/auth/login"),
      body: userData,
    );
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final token = responseBody['token'];
      await SharedPreference().setUser(token);
      return true;
    } else {
      print("login failed");
      return false;
    }
  }
}
