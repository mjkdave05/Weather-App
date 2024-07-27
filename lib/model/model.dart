class WeatherModel {
  final Map<String, dynamic> currentWeather;
  final Map<String, dynamic> hourly;

  WeatherModel({required this.currentWeather, required this.hourly});

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    final currentWeather = data['current_weather'] as Map<String, dynamic>;
    final hourly = data['hourly'] as Map<String, dynamic>;
    return WeatherModel(currentWeather: currentWeather, hourly: hourly);
  }
}

class CurrentWeather {
  final double temperature;
  final double windspeed;
  final int weathercode;
  final int winddirection;
  final int isDay;

  CurrentWeather({
    required this.temperature,
    required this.windspeed,
    required this.weathercode,
    required this.winddirection,
    required this.isDay,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> data) {
    final temperature = data['temperature'] as double;
    final windspeed = data['windspeed'] as double;
    final weathercode = data['weathercode'] as int;
    final winddirection = data['winddirection'] as int;
    final isDay = data['isDay'] as int;

    return CurrentWeather(
      temperature: temperature,
      windspeed: windspeed,
      weathercode: weathercode,
      winddirection: winddirection,
      isDay: isDay,
    );
  }
}

class HourlyCast {
  final List<String> time;
  final List<double> temperature;

  HourlyCast({required this.time, required this.temperature});

  factory HourlyCast.fromJson(Map<String, dynamic> data) {
    final List<String> time = List<String>.from(data['time']);
    final List<double> temperature = List<double>.from(data['temperature_2m']);
    return HourlyCast(time: time, temperature: temperature);
  }
}
