import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/repository/weather_repository.dart';
import 'package:project/usecase/usecase.dart';

class HistoryUsecase implements UseCase<Either<DioException, Response>, NoParams> {
  HistoryUsecase(this.weatherRepository);
  final WeatherRepository weatherRepository;

  @override
  Future<Either<DioException, Response>> call({NoParams? params}) {
    return weatherRepository.getHistory();
  }
}
