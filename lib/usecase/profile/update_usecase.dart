import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/repository/profile_repository.dart';
import 'package:project/usecase/usecase.dart';

class UpdateParams {
  final String? firstName;
  final String? lastName;
  final String? avatar;

  UpdateParams({
    this.firstName,
    this.lastName,
    this.avatar,
  });
}

class UpdateUsecase implements UseCase<Either<DioException, Response>, UpdateParams> {
  final ProfileRepository profileRepository;

  UpdateUsecase(this.profileRepository);

  @override
  Future<Either<DioException, Response>> call({UpdateParams? params}) {
    return profileRepository.updateProfile(
      params?.firstName,
      params?.lastName,
      params?.avatar,
    );
  }
}
