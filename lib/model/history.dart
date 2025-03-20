import 'package:project/model/weather.dart';

class HistoryModel {
  final DateTime date;
  final List<WeatherModel> weathers;

  HistoryModel({
    required this.date,
    required this.weathers,
  });
}
