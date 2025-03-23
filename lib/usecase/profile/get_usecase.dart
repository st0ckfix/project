import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/repository/profile_repository.dart';
import 'package:project/usecase/usecase.dart';

class GetUsecase implements UseCase<Either<DioException, Response>, NoParams> {
  final ProfileRepository profileRepository;

  GetUsecase(this.profileRepository);

  @override
  Future<Either<DioException, Response>> call({NoParams? params}) {
    return profileRepository.getProfile();
  }
}
