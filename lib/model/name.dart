class City {
  final String countryCode;
  final String code;
  final Coordinates coordinates;
  final String name;
  final String timeZone;
  final NameTranslations nameTranslations;

  City(
      {required this.countryCode,
      required this.code,
      required this.coordinates,
      required this.name,
      required this.timeZone,
      required this.nameTranslations});

  factory City.fromJson(Map<String, dynamic> json) {
    final countryCode = json['country_code'] ?? '';
    final code = json['code'] ?? '';
    final coordinates = Coordinates.fromJson(json['coordinates']);
    final name = json['name'] ?? '';
    final timeZone = json['time_zone'] ?? '';
    final nameTranslations =
        NameTranslations.fromJson(json['name_translations']);

    return City(
        countryCode: countryCode,
        code: code,
        coordinates: coordinates,
        name: name,
        timeZone: timeZone,
        nameTranslations: nameTranslations);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country_code'] = countryCode;
    data['code'] = code;
    data['coordinates'] = coordinates.toJson();
    data['name'] = name;
    data['time_zone'] = timeZone;
    data['name_translations'] = nameTranslations.toJson();
    return data;
  }
}

class Coordinates {
  final double lat;
  final double lon;

  Coordinates({required this.lat, required this.lon});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    final lat = json['lat'] * 1.0 ?? 0.1;
    final lon = json['lon'] * 1.0 ?? 0.1;
    return Coordinates(lat: lat, lon: lon);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lon'] = lon;
    return data;
  }
}

class NameTranslations {
  final String en;

  NameTranslations({required this.en});

  factory NameTranslations.fromJson(Map<String, dynamic> json) {
    final en = json['en'] ?? '';
    return NameTranslations(en: en);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    return data;
  }
}
