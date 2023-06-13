class Cheap {
  final bool success;
  final Map<String, FlightDetails> data;
  final String currency;

  Cheap({
    required this.success,
    required this.data,
    required this.currency,
  });

  factory Cheap.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> jsonData = json['data'];
    final Map<String, FlightDetails> flightDetails = jsonData.map(
      (key, value) => MapEntry(key, FlightDetails.fromJson(value)),
    );

    return Cheap(
      success: json['success'],
      data: flightDetails,
      currency: json['currency'],
    );
  }
}

class FlightDetails {
  final String origin;
  final String destination;
  final int price;
  final String airline;
  final int flightNumber;
  final DateTime departureAt;
  final DateTime returnAt;
  final int transfers;
  final DateTime expiresAt;

  FlightDetails({
    required this.origin,
    required this.destination,
    required this.price,
    required this.airline,
    required this.flightNumber,
    required this.departureAt,
    required this.returnAt,
    required this.transfers,
    required this.expiresAt,
  });

  factory FlightDetails.fromJson(Map<String, dynamic> json) {
    return FlightDetails(
      origin: json['origin'] ?? '',
      destination: json['destination'] ?? '',
      price: json['price'] ?? 0,
      airline: json['airline'] ?? '',
      flightNumber: json['flight_number'] ?? 0,
      departureAt: DateTime.parse(json['departure_at']),
      returnAt: DateTime.parse(json['return_at']),
      transfers: json['transfers'] ?? 0,
      expiresAt: DateTime.parse(json['expires_at']),
    );
  }
}
