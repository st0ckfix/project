// authenticate_repository_impl.dart

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/repository/authenticate_repository.dart';

class AuthenticateRepositoryImpl extends AuthenticateRepository {
  AuthenticateRepositoryImpl(super.apiService);

  @override
  Future<Either<DioException, Response>> login(String username, String password) {
    return handleResponse(
      () => apiService.loginUser(username, password),
      (response) => response,
    );
  }

  @override
  Future<Either<DioException, Response>> register(String username, String email, String password) {
    return handleResponse(
      () => apiService.registerUser(username, email, password),
      (response) => response,
    );
  }

  @override
  Future<Either<DioException, Response>> logout(String accessToken, String refreshToken) {
    return handleResponse(
      () => apiService.logoutUser(accessToken, refreshToken),
      (response) => response,
    );
  }

  @override
  Future<Either<DioException, Response>> refreshToken(String refreshToken) {
    return handleResponse(
      () => apiService.refreshToken(refreshToken),
      (response) => response,
    );
  }
}
