import 'dart:convert';

import 'package:http/http.dart' as http;

const host = 'https://ea.allgetz.com/api/v1/site';

class BaseClient {
  var client = http.Client();

  Future<dynamic> get(String api) async {
    var url = Uri.parse(host + api);

    var response = await client.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print('Failed to load ${response.statusCode}');
    }
  }

  Future<dynamic> post(String api, dynamic data) async {
    var body = json.encode(data);
    var url = Uri.parse(host + api);

    var headers = {'Content-Type': 'application/json'};

    var response = await client.post(url, body: body, headers: headers);

    if (response.statusCode == 200) {
      print('Successfull ${response.statusCode}');

      return response.body;
    } else {
      print('Failed to load ${response.statusCode}');
    }
  }
}

abstract class BaseApiServices {
  Future<dynamic> getApi(String hostUrl, String unEncodedPath);
  Future<dynamic> postApi(var data, String hostUrl, String unEncodedPath);
}
