class OneFlightInformationModel {
  List<DataOneFlight> data;
  String currency;

  OneFlightInformationModel({required this.data, required this.currency});

  factory OneFlightInformationModel.fromJson(Map<String, dynamic> json) {
    final data = <DataOneFlight>[];
    json['data'].forEach((v) {
      data.add(DataOneFlight.fromJson(v));
    });

    final currency = json['currency'];
    return OneFlightInformationModel(data: data, currency: currency);
  }
}

class DataOneFlight {
  final String origin;
  final String destination;
  final String originAirport;
  final String destinationAirport;
  final int price;
  final String airline;
  final String flightNumber;
  final String departureAt;
  final int transfers;
  final int returnTransfers;
  final int duration;
  final int durationTo;
  final int durationBack;
  final String link;

  DataOneFlight(
      {required this.origin,
      required this.destination,
      required this.originAirport,
      required this.destinationAirport,
      required this.price,
      required this.airline,
      required this.flightNumber,
      required this.departureAt,
      required this.transfers,
      required this.returnTransfers,
      required this.duration,
      required this.durationTo,
      required this.durationBack,
      required this.link});

  factory DataOneFlight.fromJson(Map<String, dynamic> json) {
    final origin = json['origin'] ?? '';
    final destination = json['destination'] ?? '';
    final originAirport = json['origin_airport'] ?? '';
    final destinationAirport = json['destination_airport'] ?? '';
    final price = json['price'] ?? 0;
    final airline = json['airline'] ?? '';
    final flightNumber = json['flight_number'] ?? '';
    final departureAt = json['departure_at'] ?? '';
    final transfers = json['transfers'] ?? 0;
    final returnTransfers = json['return_transfers'] ?? 0;
    final duration = json['duration'] ?? 0;
    final durationTo = json['duration_to'] ?? 0;
    final durationBack = json['duration_back'] ?? 0;
    final link = json['link'] ?? '';

    return DataOneFlight(
        origin: origin,
        destination: destination,
        originAirport: originAirport,
        destinationAirport: destinationAirport,
        price: price,
        airline: airline,
        flightNumber: flightNumber,
        departureAt: departureAt,
        transfers: transfers,
        returnTransfers: returnTransfers,
        duration: duration,
        durationTo: durationTo,
        durationBack: durationBack,
        link: link);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['origin'] = origin;
    data['destination'] = destination;
    data['origin_airport'] = originAirport;
    data['destination_airport'] = destinationAirport;
    data['price'] = price;
    data['airline'] = airline;
    data['flight_number'] = flightNumber;
    data['departure_at'] = departureAt;
    data['transfers'] = transfers;
    data['return_transfers'] = returnTransfers;
    data['duration'] = duration;
    data['duration_to'] = durationTo;
    data['duration_back'] = durationBack;
    data['link'] = link;
    return data;
  }
}
