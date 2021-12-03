import 'package:flutter/material.dart';
import 'package:weather_example/api/weather_api.dart';
import 'package:weather_example/screens/weather_forecast_screen.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    cursorColor: Colors.blueGrey[800],
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Entry City Name',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Color(0xFFE47373),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      icon: Icon(
                        Icons.location_city,
                        color: Color(0xFFE47373),
                        size: 50,
                      ),
                    ),
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFE47373)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Color(0xFFE47373))))),
                onPressed: () async {
                  var weatherInfo = await WeatherApi()
                      .fetchWeatherForecast(cityName: cityName, isCity: true);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WeatherForecastScreen(
                      locationWeather: weatherInfo,
                      dayOfWeek: 0,
                    );
                  }));
                },
                child: Text(
                  'Get Weather',
                  style: TextStyle(fontSize: 35.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
