import 'package:flutter/material.dart';
import 'package:weather_example/models/weather_forecast_daily.dart';
import 'package:weather_example/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  final int dayOfWeek;

  const CityView({required this.snapshot, required this.dayOfWeek});

  @override
  Widget build(BuildContext context) {
    var city = snapshot.data!.city!.name;
    var country = snapshot.data!.city!.country;
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch(snapshot.data!.list![dayOfWeek].dt! * 1000);

    return Container(
      child: Column(
        children: [
          Text(
            "$city, $country",
            style: TextStyle(
                fontSize: 34, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 10.0),
          Text(
            Util.getFormattedData(formattedDate),
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );

      /*Container(
      child: Column(
        children: [
          Text(
            '$city, $country',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
              color: Colors.black87,
            ),
          ),
          Text(
            Util.getFormattedData(formattedDate),
            style: TextStyle(fontSize: 15.0),
          )
        ],
      ),
    );*/
  }
}
