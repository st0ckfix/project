import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class AuthenticateRepository {
  Future<Either<DioException, Response>> login(
      String username, String password);
}
