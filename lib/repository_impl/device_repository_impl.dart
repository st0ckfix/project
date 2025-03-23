// device_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:latlng/latlng.dart';
import 'package:project/repository/device_repository.dart';

class DeviceRepositoryImpl extends DeviceRepository {
  DeviceRepositoryImpl(super.apiService);

  @override
  Future<Either<DioException, Response>> getDevice() {
    return handleResponse(
      () => apiService.getDevice(),
      (response) => response,
    );
  }

  @override
  Future<Either<DioException, Response>> addDevice(String deviceName, LatLng location) {
    return handleResponse(
      () => apiService.addDeivce(deviceName, location),
      (response) => response,
    );
  }

  @override
  Future<Either<DioException, Response>> getWeather() {
    return handleResponse(
      () => apiService.getWeatherDevice(),
      (response) => response,
    );
  }

  @override
  Future<Either<DioException, Response>> removeDevice(String deviceId) {
    return handleResponse(
      () => apiService.removeDevice(deviceId),
      (response) => response,
    );
  }
}
