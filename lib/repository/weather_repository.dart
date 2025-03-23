import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/repository/base_repository.dart';

abstract class WeatherRepository extends BaseRepository {
  WeatherRepository(super.apiService);
  Future<Either<DioException, Response>> getHistory();

  Future<Either<DioException, Response>> getWeather();
}
