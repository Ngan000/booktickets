class Data {
  final String origin;
  String destination;
  final String originAirport;
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

  Data(
      this.origin,
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
    print(json);
    return Data(
        json['origin'] as String,
        json['destination'] as String,
        json['origin_airport'] as String,
        json['destination_airport'] as String,
        json['price'] as int,
        json['airline'] as String,
        json['flight_number'] as String,
        DateTime.parse(json['departure_at']),
        DateTime.parse(json['return_at']),
        json['transfers'] as int,
        json['return_transfers'] as int,
        json['duration'] as int,
        json['duration_to'] as int,
        json['duration_back'] as int,
        json['link'] as String);
  }

  @override
  String toString() {
    return '{ ${this.origin},${this.destination},${this.originAirport},${this.destinationAirport},${this.price},${this.airline},${this.flightNumber},'
        '${this.departureAt},${this.returnAt},${this.transfers},${this.returnTransfers},${this.duration},${this.durationTo},${this.durationBack},${this.link} }';
  }
}
