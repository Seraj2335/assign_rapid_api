import 'dart:convert';

import 'package:http/http.dart' as http;

class APIService {
  static const String _baseUrl =
      "https://cricbuzz-cricket.p.rapidapi.com/matches/v1/";

  static const Map<String, String> _headers = {
    "x-rapidapi-key": "5f2bf8782emsh8d081600f7dcc28p1c5962jsn709b102ce124",
    "x-rapidapi-host": "cricbuzz-cricket.p.rapidapi.com",
  };

  Future<dynamic> get(type) async {
    Uri uri = Uri.parse("$_baseUrl$type");
    final response = await http.get(uri, headers: _headers);
    if (response.statusCode == 200) {
      // print('>>>>>>>>>>${response.body}');
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load json data');
    }
  }
}
