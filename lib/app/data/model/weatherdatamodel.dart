// To parse this JSON data, do
//
//     final weatherDataModel = weatherDataModelFromJson(jsonString);

import 'dart:convert';

WeatherDataModel weatherDataModelFromJson(String str) =>
    WeatherDataModel.fromJson(json.decode(str));

String weatherDataModelToJson(WeatherDataModel data) =>
    json.encode(data.toJson());

class WeatherDataModel {
  final List<Weather> weather;
  final Main main;
  final Wind wind;
  final String name;
  final int cod;

  WeatherDataModel({
    required this.weather,
    required this.main,
    required this.wind,
    required this.name,
    required this.cod,
  });

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) =>
      WeatherDataModel(
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        main: Main.fromJson(json["main"]),
        wind: Wind.fromJson(json["wind"]),
        name: json["name"],
        cod: json["cod"],
      );

  Map<String, dynamic> toJson() => {
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "main": main.toJson(),
        "wind": wind.toJson(),
        "name": name,
        "cod": cod,
      };
}

class Main {
  final double temp;
  final int humidity;

  Main({
    required this.temp,
    required this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"]?.toDouble(),
        humidity: json["humidity"],
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "humidity": humidity,
      };
}

class Weather {
  final int id;
  final String main;
  final String description;

  Weather({
    required this.id,
    required this.main,
    required this.description,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
      };
}

class Wind {
  final double speed;

  Wind({
    required this.speed,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
      };
}
