import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/repository/base_repository.dart';

abstract class ProfileRepository extends BaseRepository {
  ProfileRepository(super.apiService);

  Future<Either<DioException, Response>> updateProfile(
      String? firstName, String? lastName, String? avatar);
  Future<Either<DioException, Response>> getProfile();
}
