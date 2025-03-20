import 'package:project/model/device.dart';
import 'package:project/model/weather.dart';

final listWeather = [
  WeatherModel(
    icon: 'assets/cloud.png',
    time: 9,
    temperature: 18.0,
    description: 'Cloudy',
    humidity: 80,
    moisture: 60,
    light: 100,
  ),
  WeatherModel(
    icon: 'assets/blowing.png',
    time: 10,
    temperature: 19.0,
    description: 'Windy',
    humidity: 70,
    moisture: 50,
    light: 200,
  ),
  WeatherModel(
    icon: 'assets/sun_cloud.png',
    time: 11,
    temperature: 24.0,
    description: 'Partly Cloudy',
    humidity: 60,
    moisture: 40,
    light: 300,
  ),
  WeatherModel(
    icon: 'assets/sunny.png',
    time: 12,
    temperature: 25.0,
    description: 'Sunny',
    humidity: 50,
    moisture: 30,
    light: 400,
  ),
  WeatherModel(
    icon: 'assets/rain.png',
    time: 13,
    temperature: 26.0,
    description: 'Rainy',
    humidity: 40,
    moisture: 20,
    light: 500,
  ),
];

final listDevice = [
  DeviceModel(
    name: 'Device 1',
    weather: listWeather[0],
  ),
  DeviceModel(
    name: 'Device 2',
    weather: listWeather[1],
  ),
  DeviceModel(
    name: 'Device 3',
    weather: listWeather[2],
  ),
  DeviceModel(
    name: 'Device 4',
    weather: listWeather[3],
  ),
  DeviceModel(
    name: 'Device 5',
    weather: listWeather[4],
  ),
];
