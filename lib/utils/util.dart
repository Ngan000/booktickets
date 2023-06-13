import 'package:intl/intl.dart';

class Util {
  static String converTimestampToString(String format, int timeStamp) {
    try {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp);
      return DateFormat(format, 'en').format(dateTime);
    } catch (e) {
      print('Format error');
      return "";
    }
  }

  static String converDateTimeToString(DateTime dateTime, String format) {
    try {
      return DateFormat(format).format(dateTime);
    } catch (e) {
      print('Format error');
      return "";
    }
  }

  static String converDateTimeStringToFormat(
      String datetime, String inputFormat, String outputFormat) {
    if (datetime.isEmpty) {
      return "";
    }
    try {
      DateTime tempDate = DateFormat(inputFormat).parse(datetime);
      return DateFormat(outputFormat).format(tempDate);
    } catch (e) {
      return "";
    }
  }

  static DateTime? convertStringToDateTime(String string, String inputFormat) {
    if (string.isEmpty) {
      return null;
    }
    try {
      DateTime date = DateFormat(inputFormat).parse(string);
      return date;
    } catch (e) {
      return null;
    }
  }

  static DateTime? convertStringInHours() {
    DateTime departureTime =
        DateTime(2022, 12, 31, 10, 0); // thời gian khởi hành
    DateTime arrivalTime = DateTime(2023, 1, 1, 0, 0); // thời gian đến
    Duration flightDuration = arrivalTime.difference(departureTime);

    print(
        'Duration: ${flightDuration.inHours} giờ ${flightDuration.inMinutes.remainder(60)} phút');
  }
}
