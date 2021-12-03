import 'package:flutter/material.dart';
import 'package:weather_example/api/weather_api.dart';
import 'package:weather_example/models/weather_forecast_daily.dart';
import 'package:weather_example/screens/city_screen.dart';
import 'package:weather_example/widgets/bottom_list_view.dart';
import 'package:weather_example/widgets/city_view.dart';
import 'package:weather_example/widgets/detail_view.dart';
import 'package:weather_example/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  final locationWeather;
  final dayOfWeek;

  WeatherForecastScreen({this.locationWeather, this.dayOfWeek});

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast>? forecastObject;
  String? _cityName;

  @override
  void initState() {
    super.initState();
    if (widget.locationWeather != null) {
      forecastObject = Future.value(widget.locationWeather);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text('OpenWeatherMap.org'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
        ),
        actions: [
          IconButton(
              onPressed: () async {
                var tappedName = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return CityScreen();
                }));
                if (tappedName != null) {
                  setState(() {
                    _cityName = tappedName;
                    forecastObject = WeatherApi().fetchWeatherForecast(
                        cityName: _cityName, isCity: true);
                  });
                }
              },
              icon: Icon(
                Icons.location_city,
              ))
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(height: 50),
                      CityView(snapshot: snapshot, dayOfWeek: widget.dayOfWeek),
                      SizedBox(height: 50),
                      TempView(snapshot: snapshot, dayOfWeek: widget.dayOfWeek),
                      SizedBox(height: 50),
                      DetailView(snapshot: snapshot, dayOfWeek: widget.dayOfWeek),
                      SizedBox(height: 50),
                      BottomListView(snapshot: snapshot),
                    ],
                  );
                } else {
                  return Center(
                      child: Text(
                    'City not found\nPlease, enter correct city',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
