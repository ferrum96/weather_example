import 'package:flutter/material.dart';
import 'package:weather_example/api/weather_api.dart';
import 'package:weather_example/screens/weather_forecast_screen.dart';
import 'package:weather_example/utilities/forecast_util.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index, BuildContext context, ) {
  var forecastList = snapshot.data!.list!;
  var formattedDate =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt! * 1000);
  var dayOfWeek = Util.getFormattedData(formattedDate).split(',')[0];
  var temperature = forecastList[index].temp!.day!.toStringAsFixed(0);
  var icon = forecastList[index].getIconUrl();
  var city = snapshot.data!.city!.name;

  return TextButton(
    onPressed: () async {
      var weatherInfo = await WeatherApi().fetchWeatherForecast(cityName: city, isCity: true);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WeatherForecastScreen(
          locationWeather: weatherInfo,
          dayOfWeek: index,
        );
      }));
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '$dayOfWeek',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w300,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "$temperature °C",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
            Image.network(
              icon,
              color: Colors.white,
            ),
          ],
        ),
      ],
    ),
  );
}
