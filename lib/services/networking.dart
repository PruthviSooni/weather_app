import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper({this.url});

  Future getData() async {
    String data;
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
