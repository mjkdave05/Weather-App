import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app/model/model.dart';

class WeatherApiClient{
  Future<WeatherModel> request() async{
    String url =  "https://api.open-meteo.com/v1/forecast?latitude=9.0820&longitude=8.6753&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m";
    Response response = await Dio().get(url);
    final parseData = jsonDecode(response.toString());
    final weather = WeatherModel.fromJson(parseData);
    return weather;
  }
}