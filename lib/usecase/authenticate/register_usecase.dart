// register_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/repository/authenticate_repository.dart';
import 'package:project/usecase/usecase.dart';

class RegisterParams {
  final String username;
  final String email;
  final String password;

  RegisterParams({required this.username, required this.email, required this.password});
}

class RegisterUsecase implements UseCase<Either<DioException, Response>, RegisterParams> {
  final AuthenticateRepository authenticateRepository;

  RegisterUsecase(this.authenticateRepository);

  @override
  Future<Either<DioException, Response>> call({RegisterParams? params}) {
    return authenticateRepository.register(params!.username, params.email, params.password);
  }
}
