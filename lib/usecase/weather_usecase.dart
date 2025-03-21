import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/model/weather.dart';
import 'package:project/repository/weather_repository.dart';
import 'package:project/usecase/usecase.dart';

class WeatherUsecase
    implements UseCase<Either<DioException, List<WeatherModel>>, Null> {
  WeatherUsecase({required this.weatherRepository});
  final WeatherRepository weatherRepository;

  @override
  Future<Either<DioException, List<WeatherModel>>> call({Null params}) {
    return weatherRepository.getWeatherData();
  }
}
