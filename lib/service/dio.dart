import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project/service/sp.dart';

class DioService {
  DioService(this.sharedPreferenceService);

  late final Dio? dio;
  final SharedPreferenceService sharedPreferenceService;
  bool isDioCreated = false;

  Future<Dio> getDio() async {
    if (!isDioCreated) {
      log('Create dio');
      final accessToken = await sharedPreferenceService.getToken('access_token');
      dio = Dio(
        BaseOptions(
          baseUrl: 'http://192.168.1.4:8085/api/v1/',
          connectTimeout: Duration(seconds: 5),
          receiveTimeout: Duration(seconds: 5),
          sendTimeout: Duration(seconds: 5),
          headers: {
            'Content-Type': 'application/json',
            if (accessToken.isNotEmpty) 'Authorization': 'Bearer $accessToken',
          },
        ),
      );

      isDioCreated = true;
    }

    return dio!;
  }
}
