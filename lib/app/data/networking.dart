import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Client client = http.Client();
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;

      return data;
    } else {
      debugPrint(response.statusCode.toString());
    }
  }
}
