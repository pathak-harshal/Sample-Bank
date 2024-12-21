import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sample_bank/model/index.dart';

class ApiRepository {
  final String baseUrl = "https://dummyjson.com";

  Future<LoginResponse> login({required LoginRequest loginRequest}) async {
    if (kDebugMode) {
      print(jsonEncode(loginRequest.toJson()));
    }
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(loginRequest),
    );

    if (response.statusCode == HttpStatus.ok) {
      return LoginResponse.fromJson(jsonDecode(
        response.body,
      ) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  Future<bool> checkLoginStatus({required String accessToken}) async {
    final url = Uri.parse('$baseUrl/auth/me');
    final response = await http.get(
      url,
      headers: {
        'Authorization':
            'Bearer $accessToken', // Include access token in Bearer header
      },
    );
    if (response.statusCode == HttpStatus.ok) {
      return true;
    } else {
      return false;
    }
  }
}
