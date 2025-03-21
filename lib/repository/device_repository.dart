import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/model/device.dart';

abstract class DeviceRepository {
  Future<Either<DioException, List<DeviceModel>>> getDeviceData();
}
