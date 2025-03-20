import 'package:project/data_test/schedule_test.dart';
import 'package:project/data_test/weather_test.dart';
import 'package:project/model/device.dart';

final listDevice = [
  DeviceModel(
    name: 'Device 1',
    weather: listWeather[0],
    schedules: listSchedule,
  ),
  DeviceModel(
    name: 'Device 2',
    weather: listWeather[1],
    schedules: listSchedule2,
  ),
  DeviceModel(
    name: 'Device 3',
    weather: listWeather[2],
    schedules: listSchedule3,
  ),
  DeviceModel(
    name: 'Device 4',
    weather: listWeather[3],
    schedules: listSchedule4,
  ),
];
