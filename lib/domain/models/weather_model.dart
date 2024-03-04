class WeatherModel {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherModel(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    clouds =
        json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coord != null) {
      data['coord'] = coord!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    data['base'] = base;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    data['visibility'] = visibility;
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    data['dt'] = dt;
    if (sys != null) {
      data['sys'] = sys!.toJson();
    }
    data['timezone'] = timezone;
    data['id'] = id;
    data['name'] = name;
    data['cod'] = cod;
    return data;
  }
}

class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}

class Main {
  dynamic temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity,
      this.seaLevel,
      this.grndLevel});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['sea_level'] = seaLevel;
    data['grnd_level'] = grndLevel;
    return data;
  }
}

class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({this.speed, this.deg, this.gust});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;
    return data;
  }
}

class Clouds {
  int? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }
}

class Sys {
  String? country;
  int? sunrise;
  int? sunset;

  Sys({this.country, this.sunrise, this.sunset});

  Sys.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}


// class WeatherModel {
//   final Coord coord;
//   final List<Weather> weather;
//   final String base;
//   final Main main;
//   final int visibility;
//   final Wind wind;
//   final Clouds clouds;
//   final int dt;
//   final Sys sys;
//   final int timezone;
//   final int id;
//   final String name;
//   final int cod;

//   WeatherModel({
//     required this.coord,
//     required this.weather,
//     required this.base,
//     required this.main,
//     required this.visibility,
//     required this.wind,
//     required this.clouds,
//     required this.dt,
//     required this.sys,
//     required this.timezone,
//     required this.id,
//     required this.name,
//     required this.cod,
//   });

//   factory WeatherModel.fromJson(Map<String, dynamic> json) {
//     return WeatherModel(
//       coord: Coord.fromJson(json['coord']),
//       weather: (json['weather'] as List).map((weather) => Weather.fromJson(weather)).toList(),
//       base: json['base'],
//       main: Main.fromJson(json['main']),
//       visibility: json['visibility'],
//       wind: Wind.fromJson(json['wind']),
//       clouds: Clouds.fromJson(json['clouds']),
//       dt: json['dt'],
//       sys: Sys.fromJson(json['sys']),
//       timezone: json['timezone'],
//       id: json['id'],
//       name: json['name'],
//       cod: json['cod'],
//     );
//   }
// }

// class Coord {
//   final double lon;
//   final double lat;

//   Coord({required this.lon, required this.lat});

//   factory Coord.fromJson(Map<String, dynamic> json) {
//     return Coord(
//       lon: json['lon'].toDouble(),
//       lat: json['lat'].toDouble(),
//     );
//   }
// }

// class Weather {
//   final int id;
//   final String main;
//   final String description;
//   final String icon;

//   Weather({required this.id, required this.main, required this.description, required this.icon});

//   factory Weather.fromJson(Map<String, dynamic> json) {
//     return Weather(
//       id: json['id'],
//       main: json['main'],
//       description: json['description'],
//       icon: json['icon'],
//     );
//   }
// }

// class Main {
//   final double temp;
//   final double feelsLike;
//   final double tempMin;
//   final double tempMax;
//   final int pressure;
//   final int humidity;
//   final int seaLevel;
//   final int grndLevel;

//   Main({
//     required this.temp,
//     required this.feelsLike,
//     required this.tempMin,
//     required this.tempMax,
//     required this.pressure,
//     required this.humidity,
//     required this.seaLevel,
//     required this.grndLevel,
//   });

//   factory Main.fromJson(Map<String, dynamic> json) {
//     return Main(
//       temp: json['temp'].toDouble(),
//       feelsLike: json['feels_like'].toDouble(),
//       tempMin: json['temp_min'].toDouble(),
//       tempMax: json['temp_max'].toDouble(),
//       pressure: json['pressure'],
//       humidity: json['humidity'],
//       seaLevel: json['sea_level'],
//       grndLevel: json['grnd_level'],
//     );
//   }
// }

// class Wind {
//   final double speed;
//   final int deg;
//   final double gust;

//   Wind({required this.speed, required this.deg, required this.gust});

//   factory Wind.fromJson(Map<String, dynamic> json) {
//     return Wind(
//       speed: json['speed'].toDouble(),
//       deg: json['deg'],
//       gust: json['gust'].toDouble(),
//     );
//   }
// }

// class Clouds {
//   final int all;

//   Clouds({required this.all});

//   factory Clouds.fromJson(Map<String, dynamic> json) {
//     return Clouds(
//       all: json['all'],
//     );
//   }
// }

// class Sys {
//   final int type;
//   final int id;
//   final String country;
//   final int sunrise;
//   final int sunset;

//   Sys({required this.type, required this.id, required this.country, required this.sunrise, required this.sunset});

//   factory Sys.fromJson(Map<String, dynamic> json) {
//     return Sys(
//       type: json['type'],
//       id: json['id'],
//       country: json['country'],
//       sunrise: json['sunrise'],
//       sunset: json['sunset'],
//     );
//   }
// }
