import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:latlng/latlng.dart';
import 'package:project/repository/device_repository.dart';
import 'package:project/usecase/usecase.dart';

class AddParams {
  final String deviceName;
  final LatLng location;

  AddParams({required this.deviceName, required this.location});
}

class AddUsecase implements UseCase<Either<DioException, Response>, AddParams> {
  final DeviceRepository deviceRepository;

  AddUsecase(this.deviceRepository);

  @override
  Future<Either<DioException, Response>> call({AddParams? params}) {
    return deviceRepository.addDevice(params!.deviceName, params.location);
  }
}
