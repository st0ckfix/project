import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/repository/device_repository.dart';
import 'package:project/usecase/usecase.dart';

class GetUsecase implements UseCase<Either<DioException, Response>, NoParams> {
  final DeviceRepository deviceRepository;

  GetUsecase(this.deviceRepository);

  @override
  Future<Either<DioException, Response>> call({NoParams? params}) {
    return deviceRepository.getDevice();
  }
}
