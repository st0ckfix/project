import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/model/device.dart';
import 'package:project/repository/device_repository.dart';
import 'package:project/usecase/usecase.dart';

class DeviceUsecase
    implements UseCase<Either<DioException, List<DeviceModel>>, Null> {
  DeviceUsecase({required this.deviceRepository});
  final DeviceRepository deviceRepository;

  @override
  Future<Either<DioException, List<DeviceModel>>> call({Null params}) {
    return deviceRepository.getDeviceData();
  }
}
