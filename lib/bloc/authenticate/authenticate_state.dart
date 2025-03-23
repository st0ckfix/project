part of 'authenticate_cubit.dart';

abstract class AuthenticateState {}

class AuthenticateInitialState extends AuthenticateState {}

class AuthenticateLoadingState extends AuthenticateState {}

class AuthenticateSuccessState extends AuthenticateState {}

class AuthenticateRegisterSuccessState extends AuthenticateState {}

class AuthenticateLogoutState extends AuthenticateState {}

class AuthenticateErrorState extends AuthenticateState {
  final String message;
  AuthenticateErrorState(this.message);
}
