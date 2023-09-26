// ignore_for_file: nullable_type_in_catch_clause

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'base_api.dart';
import 'execption/app_exception.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String hostUrl, String unEncodedPath) async {
    if (kDebugMode) {
      print(hostUrl);
    }
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.https(
          hostUrl,
          unEncodedPath,
        ),
        headers: {'Accept': 'application/json'},
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeout {
      throw RequestTimeout('');
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(
      var data, String hostUrl, String unEncodedPath) async {
    dynamic responseJson;
    try {
      final String jsonData = jsonEncode(data);
      if (kDebugMode) {
        print(jsonData);
      }
      final response = await http
          .post(
            Uri.https(hostUrl, unEncodedPath),
            headers: {'Content-Type': 'application/json'},
            body: jsonData,
          )
          .timeout(
            const Duration(seconds: 10),
          );
      responseJson = returnResponse(response);
      print(responseJson);
      print(response.body);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeout {
      throw RequestTimeout('');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        if (kDebugMode) {
          print(responseJson);
        }
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        if (kDebugMode) {
          print(responseJson);
        }
        return responseJson;
      default:
        throw FetchDataException(
            'Error Occured while making connection ${response.statusCode}');
    }
  }
}
