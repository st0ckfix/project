import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/data_source/authenticate.dart';
import 'package:project/usecase/usecase.dart';

class AuthenticateUsecase
    implements UseCase<Either<DioException, Response>, (String, String)> {
  AuthenticateUsecase({required this.authenticate});
  final Authenticate authenticate;

  @override
  Future<Either<DioException, Response>> call({(String, String)? params}) {
    return authenticate.login(params?.$1 ?? '', params?.$2 ?? '');
  }
}
