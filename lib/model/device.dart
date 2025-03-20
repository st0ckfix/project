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
}
