import 'package:flutter/material.dart';
import 'package:weather_app/client/client.dart';
import 'package:weather_app/model/model.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  WeatherModel ? weatherModel;
  List<Widget>? Hourly_cast;
  List<Widget>? Hourly_cast_time;
  List<dynamic>? hourly_temp;
  List<dynamic>? hourly_date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white70,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Current Weather",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Icon(Icons.sunny, color: Colors.amber, size: 64,),
                  SizedBox(height: 20.0,),
                  Text("${weatherModel?.currentWeather["temperature"] != null ? weatherModel?.currentWeather["temperature"]:0}C",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                      onPressed: () async{
                        print("call btn");
                        weatherModel = await WeatherApiClient().request();
                        print(weatherModel?.currentWeather);
                        hourly_temp = weatherModel?.hourly["temperature_2m"];
                        hourly_date = weatherModel?.hourly["time"];
                        Hourly_cast = hourly_temp?.map((e)=>
                            Padding(padding: EdgeInsets.only(top:10.0, bottom: 10.0), child: Text("$e C",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,),
                            ),),
                        ).toList();

                        Hourly_cast_time = hourly_date?.map((e)=>
                            Padding(padding: EdgeInsets.only(top:10.0, bottom: 10.0), child: Text("$e",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,),
                            ),),
                        ).toList();

                        setState(() {

                        });
                        //here create the client to fetch data from api
                      },
                      child: Text("Get Data"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:10.0, bottom: 10.0),
                    color: Colors.white54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: Hourly_cast_time== null ? [Text("Empty")]:Hourly_cast_time!,
                        ),
                        Column(
                          children: Hourly_cast== null ? [Text("Empty")]:Hourly_cast!,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
