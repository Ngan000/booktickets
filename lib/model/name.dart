class City {
  String? countryCode;
  String? code;
  Coordinates? coordinates;
  String? name;
  String? timeZone;
  NameTranslations? nameTranslations;
  Cases? cases;

  City(
      {this.countryCode,
      this.code,
      this.coordinates,
      this.name,
      this.timeZone,
      this.nameTranslations,
      this.cases});

  City.fromJson(Map<String, dynamic> json) {
    countryCode = json['country_code'];
    code = json['code'];
    coordinates = json['coordinates'] != null
        ? new Coordinates.fromJson(json['coordinates'])
        : null;
    name = json['name'];
    timeZone = json['time_zone'];
    nameTranslations = json['name_translations'] != null
        ? new NameTranslations.fromJson(json['name_translations'])
        : null;
    cases = json['cases'] != null ? new Cases.fromJson(json['cases']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_code'] = this.countryCode;
    data['code'] = this.code;
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates!.toJson();
    }
    data['name'] = this.name;
    data['time_zone'] = this.timeZone;
    if (this.nameTranslations != null) {
      data['name_translations'] = this.nameTranslations!.toJson();
    }
    if (this.cases != null) {
      data['cases'] = this.cases!.toJson();
    }
    return data;
  }
}

class Coordinates {
  double? lat;
  double? lon;

  Coordinates({this.lat, this.lon});

  Coordinates.fromJson(Map<String, dynamic> json) {
    lat = double.tryParse(json['lat'].toString());
    lon = double.tryParse(json['lon'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}

class NameTranslations {
  String? en;

  NameTranslations({this.en});

  NameTranslations.fromJson(Map<String, dynamic> json) {
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    return data;
  }
}

class Cases {
  String? su;

  Cases({this.su});

  Cases.fromJson(Map<String, dynamic> json) {
    su = json['su'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['su'] = this.su;
    return data;
  }
}
