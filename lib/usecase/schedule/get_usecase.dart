import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/repository/schedule_repository.dart';
import 'package:project/usecase/usecase.dart';

class GetUsecase implements UseCase<Either<DioException, Response>, String> {
  final ScheduleRepository scheduleRepository;

  GetUsecase(this.scheduleRepository);

  @override
  Future<Either<DioException, Response>> call({String? params}) {
    return scheduleRepository.getSchedule(params!);
  }
}
