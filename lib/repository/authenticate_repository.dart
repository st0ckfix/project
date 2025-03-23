import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/repository/base_repository.dart';

abstract class AuthenticateRepository extends BaseRepository {
  AuthenticateRepository(super.apiService);

  Future<Either<DioException, Response>> login(String username, String password);

  Future<Either<DioException, Response>> register(String username, String email, String password);

  Future<Either<DioException, Response>> logout(String accessToken, String refreshToken);

  Future<Either<DioException, Response>> refreshToken(String refreshToken);
}
