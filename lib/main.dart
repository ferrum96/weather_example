import 'package:flutter/material.dart';
import 'package:weather_example/screens/location_screen.dart';
import 'package:weather_example/screens/weather_forecast_screen.dart';

import 'api/weather_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.red,
          textTheme: TextTheme(
              bodyText2: TextStyle(color: Colors.white),
              bodyText1: TextStyle(color: Colors.white))),
      title: 'Flutter Demo',
      home: LocationScreen(),
    );
  }
}