import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/data_source/authenticate.dart';
import 'package:project/repository/authenticate_repository.dart';

class AuthenticateRepositoryImpl implements AuthenticateRepository {
  AuthenticateRepositoryImpl({required this.authenticate});
  final Authenticate authenticate;
  @override
  Future<Either<DioException, Response>> login(String name, String password) {
    return authenticate.login(name, password);
  }
}
