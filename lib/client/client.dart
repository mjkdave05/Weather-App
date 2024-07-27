import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:weather_app/model/model.dart';

class WeatherApiClient {
  Future<WeatherModel> request() async {
    String url =
        "https://api.open-meteo.com/v1/forecast?latitude=9.0820&longitude=8.6753&current_weather=true&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m";
    Response response = await Dio().get(url);
    if (response.statusCode == 200) {
      final parseData = jsonDecode(response.toString());
      final weather = WeatherModel.fromJson(parseData);
      return weather;
    } else {
      throw Exception("Failed to load weather data");
    }
  }
}
