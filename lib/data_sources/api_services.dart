import 'dart:convert';
import 'dart:developer';

import 'package:booktickets/model/cheap.dart';
import 'package:get/get.dart';

import '../model/post.dart';
import 'api_urls.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<Data>> fetchUser() {
    return http.get(ApiUrls().API_USER_LIST).then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        print(response.reasonPhrase);
        throw new Exception("Lỗi load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List userList = useListContainer['results'];
      return userList
          .map((contactRaw) => new Data.fromJson(contactRaw))
          .toList();
    });
  }

  static Future<List<Data>> flightUser() {
    var uri = Uri(
        scheme: 'https',
        host: 'api.travelpayouts.com',
        path: '/aviasales/v3/prices_for_dates',
        queryParameters: {
          'origin': 'HAN',
          'destination': '',
          'departure_at': '2023-07',
          'return_at': '2023-08',
          'cy': 'vnd',
          'token': '1f9c3d0604715bd69c6f108c8d0c8f34'
        });
    print("uri");
    return http.get(uri).then((http.Response response) {
      final String jsonBody = response.body;
      print(response.body);
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        print(response.reasonPhrase);
        throw new Exception("Lỗi load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List userList = useListContainer['data'];
      return userList
          .map((contactRaw) => new Data.fromJson(contactRaw))
          .toList();
    });
  }

  static Future<Cheap> flightCheap(
      {required String startTime, required String endTime}) async {
    try {
      var uri = Uri(
          scheme: 'https',
          host: 'api.travelpayouts.com',
          path: '/v1/prices/calendar',
          queryParameters: {
            'departure_at': startTime,
            'return_at': endTime,
            'token': '1f9c3d0604715bd69c6f108c8d0c8f34'
          });
      final response = await http.get(uri);

      final jsonData = response.body;
      return Cheap.fromJson(jsonDecode(jsonData));
    } catch (e) {
      throw Exception(e);
    }
  }
}
