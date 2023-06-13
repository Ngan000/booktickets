import 'dart:convert';

import '../model/name.dart';
import '../model/post.dart';
import 'package:http/http.dart' as http;

class ApiNameService {
  static Future<List<City>> nameUser() {
    // var uri = Uri(
    //   scheme: 'https',
    //   host: 'api.travelpayouts.com',
    //   path: '/data/en/cities',
    // );
    // print("uri");
    return http
        .get(Uri.parse('https://api.travelpayouts.com/data/en/cities.json'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      print(response.body);
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        print(response.reasonPhrase);
        throw new Exception("Lỗi load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);
      final List userList = useListContainer;
      return userList
          .map((contactRaw) => new City.fromJson(contactRaw))
          .toList();
    });
  }
}
