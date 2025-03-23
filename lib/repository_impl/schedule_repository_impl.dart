// schedule_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/model/schedule.dart';
import 'package:project/repository/schedule_repository.dart';

class ScheduleRepositoryImpl extends ScheduleRepository {
  ScheduleRepositoryImpl(super.apiService);

  @override
  Future<Either<DioException, Response>> addSchedule(String deviceId, ScheduleModel schedule) {
    return handleResponse(
      () => apiService.addSchedule(deviceId, schedule),
      (response) => response,
    );
  }

  @override
  Future<Either<DioException, Response>> getSchedule(String deviceId) {
    return handleResponse(
      () => apiService.getSchedule(deviceId),
      (response) => response,
    );
  }

  @override
  Future<Either<DioException, Response>> removeSchedule(String deviceId, String scheduleId) {
    return handleResponse(
      () => apiService.removeSchedule(deviceId, scheduleId),
      (response) => response,
    );
  }

  @override
  Future<Either<DioException, Response>> updateSchedule(String deviceId, ScheduleModel schedule) {
    return handleResponse(
      () => apiService.updateSchedule(deviceId, schedule),
      (response) => response,
    );
  }
}
