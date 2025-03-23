// weather_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherRepositoryImpl(super.apiService);

  @override
  Future<Either<DioException, Response>> getHistory() {
    return handleResponse(
      () => apiService.getHistory(),
      (response) => response,
    );
  }

  @override
  Future<Either<DioException, Response>> getWeather() {
    return handleResponse(
      () => apiService.getWeather(),
      (response) => response,
    );
  }
}
