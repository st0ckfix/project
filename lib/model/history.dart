import 'package:project/model/weather.dart';

class HistoryModel {
  final DateTime date;
  final List<WeatherModel> weathers;

  HistoryModel({
    required this.date,
    required this.weathers,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      date: DateTime.parse(json['date']),
      weathers: (json['weathers'] as List)
          .map(
            (e) => WeatherModel.fromJson(e),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'weathers': weathers.map((e) => e.toJson()).toList(),
    };
  }
}
