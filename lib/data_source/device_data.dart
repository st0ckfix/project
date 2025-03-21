import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/data_test/device_test.dart';
import 'package:project/model/device.dart';

class DeviceData {
  Future<Either<DioException, List<DeviceModel>>> getDeviceData() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      return Right(listDevice);
    } catch (e) {
      return Left(
        DioException(
          requestOptions: RequestOptions(path: ''),
          message: e.toString(),
        ),
      );
    }
  }
}
