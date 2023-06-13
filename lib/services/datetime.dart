import 'dart:convert';
import 'dart:core';
import 'package:booktickets/model/post.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class TimeServices {
  static List<String> list30Days() {
    DateTime currentDate = DateTime.now();
    List<String> dateList = [];

    for (int i = 0; i < 30; i++) {
      DateTime nextDate = currentDate.add(Duration(days: i));
      String formattedDate = DateFormat('yyyy-MM-dd').format(nextDate);
      dateList.add(formattedDate);
    }

    return dateList;
  }
}
