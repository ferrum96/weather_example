import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_example/models/weather_forecast_daily.dart';
import 'package:weather_example/utilities/forecast_util.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  final int dayOfWeek;

  const DetailView({required this.snapshot, required this.dayOfWeek});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list!;
    var pressure = forecastList[dayOfWeek].pressure! * 0.750062;
    var humidity = forecastList[dayOfWeek].humidity;
    var windSpeed = forecastList[dayOfWeek].speed;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Util.getItem(FontAwesomeIcons.thermometerThreeQuarters,
              pressure.round(), 'mm Hg'),
          Util.getItem(FontAwesomeIcons.cloudRain, humidity!, '%'),
          Util.getItem(FontAwesomeIcons.wind, windSpeed!.round(), 'm/s'),
        ],
      ),
    );
  }
}
