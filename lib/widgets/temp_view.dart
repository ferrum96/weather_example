import 'package:flutter/material.dart';
import 'package:weather_example/models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  final int dayOfWeek;

  const TempView({required this.snapshot, required this.dayOfWeek});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list!;
    var icon = forecastList[dayOfWeek].getIconUrl();
    var temp = forecastList[dayOfWeek].temp!.day!.toStringAsFixed(0);
    var description = forecastList[dayOfWeek].weather![0].description!.toUpperCase();
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            icon!,
            scale: 0.5,
            color: Colors.white,
          ),
          SizedBox(width: 16.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$temp °C",
                style: TextStyle(fontWeight: FontWeight.w100, fontSize: 54),
              ),
              Text("$description",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18)),
            ],
          )
        ],
      ),
    );

      /*Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            icon!,
            scale: 0.5,
            color: Colors.black,
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            children: [
              Text(
                '$temp °C',
                style: TextStyle(
                  fontSize: 54.0,
                  color: Colors.black87,
                ),
              ),
              Text('$description', style: TextStyle(fontSize: 18.0, color: Colors.black87),)
            ],
          )
        ],
      ),
    );*/
  }
}
