import 'dart:convert';

import 'package:get/get.dart';

import '../model/name.dart';
import '../model/post.dart';
import 'package:http/http.dart' as http;

class ApiNameService {
  static Future<List<City>> nameUserFind() async {
    try {
      final uri =
          Uri.parse('https://api.travelpayouts.com/data/en/cities.json');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as List<dynamic>;
        return jsonData.map((e) => City.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
