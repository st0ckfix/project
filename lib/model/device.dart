import 'package:project/model/schedule.dart';
import 'package:project/model/weather.dart';

class DeviceModel {
  final String name;
  final WeatherModel weather;
  final List<ScheduleModel>? schedules;

  DeviceModel({
    required this.name,
    required this.weather,
    this.schedules,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'weather': weather.toJson(),
      'schedules': schedules?.map((x) => x.toJson()).toList(),
    };
  }

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      name: json['name'],
      weather: WeatherModel.fromJson(json['weather']),
      schedules: List<ScheduleModel>.from(
          json['schedules'].map((x) => ScheduleModel.fromJson(x))),
    );
  }
}
