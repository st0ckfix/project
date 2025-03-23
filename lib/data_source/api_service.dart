import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:latlng/latlng.dart';
import 'package:project/model/schedule.dart';
import 'package:project/service/dio.dart';

class ApiService {
  ApiService(this.dioService);

  final DioService dioService;

  // Helper method to handle API requests
  Future<Either<DioException, Response>> _request({
    required String endpoint,
    required String method,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      late Response response;
      final dio = await dioService.getDio();
      switch (method) {
        case 'GET':
          response = await dio.get(endpoint, queryParameters: queryParameters);
          break;
        case 'POST':
          response = await dio.post(endpoint, data: data);
          log(response.toString());
          log(response.data.toString());
          log(response.statusCode.toString());
          break;
        case 'PUT':
          response = await dio.put(endpoint, data: data);
          break;
        case 'DELETE':
          response = await dio.delete(endpoint, data: data);
          break;
        default:
          throw Exception('Unsupported HTTP method');
      }

      return Right(response);
    } on DioException catch (e) {
      return Left(e);
    }
  }

  // Auth APIs
  Future<Either<DioException, Response>> registerUser(String username, String email, String password) {
    return _request(
      endpoint: 'auth/register',
      method: 'POST',
      data: {
        'username': username,
        'email': email,
        'password': password,
      },
    );
  }

  Future<Either<DioException, Response>> loginUser(String username, String password) {
    return _request(
      endpoint: 'auth/login',
      method: 'POST',
      data: {
        'username': username,
        'password': password,
      },
    );
  }

  Future<Either<DioException, Response>> logoutUser(String accessToken, String refreshToken) {
    return _request(
      endpoint: 'auth/logout',
      method: 'POST',
      data: {
        'access_token': accessToken,
        'refresh_token': refreshToken,
      },
    );
  }

  Future<Either<DioException, Response>> refreshToken(String refreshToken) {
    return _request(
      endpoint: 'auth/refresh',
      method: 'POST',
      data: {
        'refresh_token': refreshToken,
      },
    );
  }

  // Profile APIs
  Future<Either<DioException, Response>> updateProfile(String? firstName, String? lastName, String? avatar) {
    return _request(
      endpoint: 'profile/update',
      method: 'POST',
      data: {
        'first_name': firstName,
        'last_name': lastName,
        'avatar': avatar,
      },
    );
  }

  Future<Either<DioException, Response>> getProfile() {
    return _request(
      endpoint: 'profile/get',
      method: 'GET',
    );
  }

  // Weather APIs
  Future<Either<DioException, Response>> getWeather() {
    return _request(
      endpoint: 'weather/get',
      method: 'GET',
    );
  }

  Future<Either<DioException, Response>> getHistory() {
    return _request(
      endpoint: 'weather/history',
      method: 'GET',
    );
  }

  // Device APIs
  Future<Either<DioException, Response>> addDeivce(String deviceName, LatLng location) {
    return _request(
      endpoint: 'device/add',
      method: 'POST',
      data: {
        'device_name': deviceName,
        'lat': location.latitude,
        'lng': location.longitude,
      },
    );
  }

  Future<Either<DioException, Response>> getDevice() {
    return _request(
      endpoint: 'device/get',
      method: 'GET',
    );
  }

  Future<Either<DioException, Response>> removeDevice(String deviceId) {
    return _request(
      endpoint: 'device/remove',
      method: 'POST',
      data: {
        'device_id': deviceId,
      },
    );
  }

  Future<Either<DioException, Response>> getWeatherDevice() {
    return _request(
      endpoint: 'device/get_weather',
      method: 'GET',
    );
  }

  // Schedule APIs
  Future<Either<DioException, Response>> getSchedule(String deviceId) {
    return _request(
      endpoint: 'schedule/get',
      method: 'GET',
      queryParameters: {
        'device_id': deviceId,
      },
    );
  }

  Future<Either<DioException, Response>> addSchedule(String deviceId, ScheduleModel schedule) {
    return _request(
      endpoint: 'schedule/add',
      method: 'POST',
      data: {
        'device_id': deviceId,
        'schedule_id': schedule.deviceId,
        'description': schedule.description,
        'hour': schedule.timeOfDay.hour,
        'minute': schedule.timeOfDay.minute,
        'is_repeat': schedule.isRepeat,
        'is_snooze': schedule.isSnooze,
        'repeat_list': schedule.repeatList.toString(),
      },
    );
  }

  Future<Either<DioException, Response>> updateSchedule(String deviceId, ScheduleModel schedule) {
    return _request(
      endpoint: 'schedule/update',
      method: 'POST',
      data: {
        'device_id': deviceId,
        'schedule_id': schedule.deviceId,
        'description': schedule.description,
        'hour': schedule.timeOfDay.hour,
        'minute': schedule.timeOfDay.minute,
        'is_repeat': schedule.isRepeat,
        'is_snooze': schedule.isSnooze,
        'repeat_list': schedule.repeatList.toString(),
      },
    );
  }

  Future<Either<DioException, Response>> removeSchedule(String deviceId, String scheduleId) {
    return _request(
      endpoint: 'schedule/remove',
      method: 'POST',
      data: {
        'device_id': deviceId,
        'schedule_id': scheduleId,
      },
    );
  }
}
