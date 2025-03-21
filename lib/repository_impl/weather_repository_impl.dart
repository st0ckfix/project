import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/data_source/weather_data.dart';
import 'package:project/model/weather.dart';
import 'package:project/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({required this.weatherData});
  final WeatherData weatherData;
  @override
  Future<Either<DioException, List<WeatherModel>>> getWeatherData() {
    return weatherData.getWeatherData();
  }
}
