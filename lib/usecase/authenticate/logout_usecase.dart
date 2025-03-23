// logout_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/repository/authenticate_repository.dart';
import 'package:project/usecase/usecase.dart';

class LogoutParams {
  final String accessToken;
  final String refreshToken;

  LogoutParams({required this.accessToken, required this.refreshToken});
}

class LogoutUsecase
    implements UseCase<Either<DioException, Response>, LogoutParams> {
  final AuthenticateRepository authenticateRepository;

  LogoutUsecase(this.authenticateRepository);

  @override
  Future<Either<DioException, Response>> call({LogoutParams? params}) {
    return authenticateRepository.logout(
        params!.accessToken, params.refreshToken);
  }
}
