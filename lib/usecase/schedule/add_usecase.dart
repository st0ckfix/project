import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/model/schedule.dart';
import 'package:project/repository/schedule_repository.dart';
import 'package:project/usecase/usecase.dart';

class AddParams {
  final String deviceId;
  final ScheduleModel schedule;

  AddParams({required this.deviceId, required this.schedule});
}

class AddUsecase implements UseCase<Either<DioException, Response>, AddParams> {
  final ScheduleRepository scheduleRepository;

  AddUsecase(this.scheduleRepository);

  @override
  Future<Either<DioException, Response>> call({AddParams? params}) {
    return scheduleRepository.addSchedule(params!.deviceId, params.schedule);
  }
}
