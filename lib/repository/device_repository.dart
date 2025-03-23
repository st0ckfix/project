import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:latlng/latlng.dart';
import 'package:project/repository/base_repository.dart';

abstract class DeviceRepository extends BaseRepository {
  DeviceRepository(super.apiService);

  Future<Either<DioException, Response>> getDevice();

  Future<Either<DioException, Response>> removeDevice(String deviceId);

  Future<Either<DioException, Response>> getWeather();

  Future<Either<DioException, Response>> addDevice(String deviceName, LatLng location);
}
