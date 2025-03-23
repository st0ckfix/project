import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/repository/schedule_repository.dart';
import 'package:project/usecase/usecase.dart';

class RemoveParams {
  final String deviceId;
  final String scheduleId;

  RemoveParams({required this.deviceId, required this.scheduleId});
}

class RemoveUsecase implements UseCase<Either<DioException, Response>, RemoveParams> {
  final ScheduleRepository scheduleRepository;

  RemoveUsecase(this.scheduleRepository);

  @override
  Future<Either<DioException, Response>> call({RemoveParams? params}) {
    return scheduleRepository.removeSchedule(params!.deviceId, params.scheduleId);
  }
}
