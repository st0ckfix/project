import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/model/schedule.dart';
import 'package:project/repository/schedule_repository.dart';
import 'package:project/usecase/usecase.dart';

class UpdateParams {
  final String deviceId;
  final ScheduleModel schedule;

  UpdateParams({required this.deviceId, required this.schedule});
}

class UpdateUsecase implements UseCase<Either<DioException, Response>, UpdateParams> {
  final ScheduleRepository scheduleRepository;

  UpdateUsecase(this.scheduleRepository);

  @override
  Future<Either<DioException, Response>> call({UpdateParams? params}) {
    return scheduleRepository.addSchedule(params!.deviceId, params.schedule);
  }
}
