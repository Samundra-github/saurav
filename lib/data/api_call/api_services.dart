import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://ea.allgetz.com/api/v1/site/";

  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    if (kDebugMode) {
      print(data);
    }
    final String url = "$baseUrl$endpoint";
    if (kDebugMode) {
      print(url);
    }
    final response = await http.post(Uri.parse(url), body: json.encode(data));
    if (kDebugMode) {
      print(response.body);
    }
    if (kDebugMode) {
      print(response);
    }
    return _handleResponse(response);
  }

  Future<dynamic> get(String endpoint) async {
    final String url = "$baseUrl$endpoint";
    final response = await http.get(Uri.parse(url));
    return _handleResponse(response);
  }

  Future<dynamic> put(String endpoint, Map<String, dynamic> data) async {
    final String url = "$baseUrl$endpoint";
    final response = await http.put(Uri.parse(url), body: json.encode(data));
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }
}
