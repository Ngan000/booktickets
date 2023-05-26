import 'dart:convert';

class Data{
  late final String origin;
  late String destination;
  late final String originAirport;
  late String destinationAirport;
  late int price;
  late String airline;
  late String flightNumber;
  late DateTime departureAt;
  late DateTime returnAt;
  late int transfers;
  late int returnTransfers;
  late int duration;
  late int durationTo;
  late int durationBack;
  late String link;

  Data(this.origin,
       this.destination,
       this.originAirport,
       this.destinationAirport,
       this.price,
       this.airline,
       this.flightNumber,
       this.departureAt,
       this.returnAt,
       this.transfers,
       this.returnTransfers,
       this.duration,
       this.durationTo,
       this.durationBack,
       this.link);

  factory Data.fromJson(dynamic json) {
    return Data(
        json['origin'] as String,
        json['destination'] as String,
        json['originAirport'] as String,
        json['destinationAirport'] as String,
        json['price'] as int,
        json['airline'] as String,
        json['flightNumber'] as String,
        json['departureAt'] as DateTime,
        json['returnAt'] as DateTime,
        json['transfers'] as int,
        json['returnTransfers'] as int,
        json['duration'] as int,
        json['durationTo'] as int,
        json['durationBack'] as int,
        json['link'] as String
    );

  }

  @override
  String toString(){
    return '{ ${this.origin},${this.destination},${this.originAirport},${this.destinationAirport},${this.price},${this.airline},${this.flightNumber},'
        '${this.departureAt},${this.returnAt},${this.transfers},${this.returnTransfers},${this.duration},${this.durationTo},${this.durationBack},${this.link} }';
  }
}

/*
Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  bool success;
  List<Datum> data;
  String currency;

  Post({
    required this.success,
    required this.data,
    required this.currency,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    currency: json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "currency": currency,
  };
}

class Datum {
  Origin origin;
  String destination;
  Origin originAirport;
  String destinationAirport;
  int price;
  String airline;
  String flightNumber;
  DateTime departureAt;
  DateTime returnAt;
  int transfers;
  int returnTransfers;
  int duration;
  int durationTo;
  int durationBack;
  String link;

  Datum({
    required this.origin,
    required this.destination,
    required this.originAirport,
    required this.destinationAirport,
    required this.price,
    required this.airline,
    required this.flightNumber,
    required this.departureAt,
    required this.returnAt,
    required this.transfers,
    required this.returnTransfers,
    required this.duration,
    required this.durationTo,
    required this.durationBack,
    required this.link,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    origin: originValues.map[json["origin"]]!,
    destination: json["destination"],
    originAirport: originValues.map[json["origin_airport"]]!,
    destinationAirport: json["destination_airport"],
    price: json["price"],
    airline: json["airline"],
    flightNumber: json["flight_number"],
    departureAt: DateTime.parse(json["departure_at"]),
    returnAt: DateTime.parse(json["return_at"]),
    transfers: json["transfers"],
    returnTransfers: json["return_transfers"],
    duration: json["duration"],
    durationTo: json["duration_to"],
    durationBack: json["duration_back"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "origin": originValues.reverse[origin],
    "destination": destination,
    "origin_airport": originValues.reverse[originAirport],
    "destination_airport": destinationAirport,
    "price": price,
    "airline": airline,
    "flight_number": flightNumber,
    "departure_at": departureAt.toIso8601String(),
    "return_at": returnAt.toIso8601String(),
    "transfers": transfers,
    "return_transfers": returnTransfers,
    "duration": duration,
    "duration_to": durationTo,
    "duration_back": durationBack,
    "link": link,
  };
}

enum Origin { HAN }

final originValues = EnumValues({
  "HAN": Origin.HAN
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
*/