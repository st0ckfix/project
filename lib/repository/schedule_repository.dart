import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/model/schedule.dart';
import 'package:project/repository/base_repository.dart';

abstract class ScheduleRepository extends BaseRepository {
  ScheduleRepository(super.apiService);

  Future<Either<DioException, Response>> getSchedule(String deviceId);

  Future<Either<DioException, Response>> addSchedule(
      String deviceId, ScheduleModel schedule);

  Future<Either<DioException, Response>> updateSchedule(
      String deviceId, ScheduleModel schedule);

  Future<Either<DioException, Response>> removeSchedule(
      String deviceId, String scheduleId);
}
