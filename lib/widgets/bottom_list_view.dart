import 'package:flutter/material.dart';
import 'package:weather_example/models/weather_forecast_daily.dart';
import 'package:weather_example/widgets/forecast_card.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const BottomListView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            '7-DAY WEATHER FORECAST',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
          Container(
            height: 140,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 2.7,
                      height: 160,
                      color: Color(0xFFE47373),
                      child: forecastCard(snapshot, index, context),
                    ),
                separatorBuilder: (context, index) =>
                    SizedBox(
                      width: 8,
                    ),
                itemCount: snapshot.data!.list!.length),
          )
        ],
      ),
    );
  }
}
