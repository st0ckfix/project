part of 'authenticate_cubit.dart';

abstract class AuthenticateCubitState extends Equatable {
  const AuthenticateCubitState();

  @override
  List<Object> get props => [];
}

final class AuthenticateCubitInitial extends AuthenticateCubitState {}

final class AuthenticateCubitLoading extends AuthenticateCubitState {}

final class AuthenticateCubitLoaded extends AuthenticateCubitState {
  const AuthenticateCubitLoaded(this.userModel);
  final UserModel userModel;

  @override
  List<Object> get props => [userModel];
}

final class AuthenticateCubitError extends AuthenticateCubitState {
  const AuthenticateCubitError(this.error);
  final DioException error;

  @override
  List<Object> get props => [error];
}
