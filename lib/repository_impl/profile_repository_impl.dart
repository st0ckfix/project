import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/repository/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  ProfileRepositoryImpl(super.apiService);

  @override
  Future<Either<DioException, Response>> getProfile() {
    return handleResponse(
      () => apiService.getProfile(),
      (response) => response,
    );
  }

  @override
  Future<Either<DioException, Response>> updateProfile(String? firstName, String? lastName, String? avatar) {
    return handleResponse(
      () => apiService.updateProfile(firstName, lastName, avatar),
      (response) => response,
    );
  }
}
