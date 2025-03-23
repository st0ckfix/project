import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/repository/device_repository.dart';
import 'package:project/usecase/usecase.dart';

class RemoveUsecase implements UseCase<Either<DioException, Response>, String> {
  final DeviceRepository deviceRepository;

  RemoveUsecase(this.deviceRepository);

  @override
  Future<Either<DioException, Response>> call({String? params}) {
    return deviceRepository.removeDevice(params!);
  }
}
