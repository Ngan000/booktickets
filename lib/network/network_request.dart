
import 'dart:convert';
import 'dart:core';
import 'package:booktickets/model/post.dart';
import 'package:http/http.dart' as http;


class NetworkRequest{
  String arrayObjsText=
      '{"datas": []}';


  getData() {
    var dataObjsJson= jsonDecode(arrayObjsText)['datas'] as List;
    List<Data> dataObjs = dataObjsJson.map((dataJson) => Data.fromJson(dataJson)).toList();
  }


  /*Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('https://api.travelpayouts.com/aviasales/v3/prices_for_dates?origin=HAN&destination=&departure_at=2023-07&return_at=2023-08&cy=vnd&token=1f9c3d0604715bd69c6f108c8d0c8f34');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }*/
}