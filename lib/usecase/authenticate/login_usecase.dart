// login_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/repository/authenticate_repository.dart';
import 'package:project/usecase/usecase.dart';

class LoginParams {
  final String username;
  final String password;

  LoginParams({required this.username, required this.password});
}

class LoginUsecase implements UseCase<Either<DioException, Response>, LoginParams> {
  final AuthenticateRepository authenticateRepository;

  LoginUsecase(this.authenticateRepository);

  @override
  Future<Either<DioException, Response>> call({LoginParams? params}) {
    return authenticateRepository.login(params!.username, params.password);
  }
}
