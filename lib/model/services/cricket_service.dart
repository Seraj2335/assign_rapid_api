import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../apis/app_exception.dart';
import 'base_service.dart';

class CricketService extends BaseService {
  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    const Map<String, String> _headers = {
      // 06b308825fmsh3f9f73526694a07p130f62jsn1949c78265b6
      // f0e38569bfmsheecc8df863644e6p181303jsnc47140b73f31
      // 5f2bf8782emsh8d081600f7dcc28p1c5962jsn709b102ce124
      "x-rapidapi-key": "06b308825fmsh3f9f73526694a07p130f62jsn1949c78265b6",
      "x-rapidapi-host": "cricbuzz-cricket.p.rapidapi.com",
    };
    try {
      print('>>>>>>>>${cricketBaseUrl + url}');
      final response = await http.get(
          Uri.parse(cricketBaseUrl + url), headers:_headers);
      print('>>>>>>>>${response.body}');
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server'
                ' with status code : ${response.statusCode}');
    }
  }
}
