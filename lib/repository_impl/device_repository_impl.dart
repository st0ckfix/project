import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/data_source/device_data.dart';
import 'package:project/model/device.dart';
import 'package:project/repository/device_repository.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  DeviceRepositoryImpl({required this.deviceData});
  final DeviceData deviceData;
  @override
  Future<Either<DioException, List<DeviceModel>>> getDeviceData() {
    return deviceData.getDeviceData();
  }
}
