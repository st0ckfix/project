import 'package:project/data_test/schedule_test.dart';
import 'package:project/data_test/weather_test.dart';
import 'package:project/model/device.dart';

final listDevice = [
  DeviceModel(
    name: 'Device A-129',
    weather: listWeather[0],
    schedules: listSchedule,
  ),
  DeviceModel(
    name: 'Device A-130S',
    weather: listWeather[1],
    schedules: listSchedule2,
  ),
  DeviceModel(
    name: 'Device BI-112',
    weather: listWeather[2],
    schedules: listSchedule3,
  ),
  DeviceModel(
    name: 'Device B-SHU',
    weather: listWeather[3],
    schedules: listSchedule4,
  ),
];
