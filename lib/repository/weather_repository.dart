import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/model/weather.dart';

abstract class WeatherRepository {
  Future<Either<DioException, List<WeatherModel>>> getWeatherData();
}
