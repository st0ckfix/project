import 'package:flutter/material.dart';
import 'package:project/model/weather.dart';

class HistoryWeatherDetail extends StatelessWidget {
  final WeatherModel weather;

  const HistoryWeatherDetail({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(weather.icon),
            SizedBox(width: 10),
            Text(
              "${weather.description} xảy ra vào lúc ${weather.time > 12 ? "${weather.time - 12}PM" : "${weather.time}AM"}",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
