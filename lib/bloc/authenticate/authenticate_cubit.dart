import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/service/sp.dart';
import 'package:project/usecase/authenticate/login_usecase.dart';
import 'package:project/usecase/authenticate/logout_usecase.dart';
import 'package:project/usecase/authenticate/register_usecase.dart';

part 'authenticate_state.dart';

class AuthenticateCubit extends Cubit<AuthenticateState> {
  final LoginUsecase _loginUsecase;
  final LogoutUsecase _logoutUsecase;
  final RegisterUsecase _registerUsecase;
  final SharedPreferenceService _sharedPreferenceService;

  AuthenticateCubit(this._loginUsecase, this._logoutUsecase, this._registerUsecase, this._sharedPreferenceService) : super(AuthenticateInitialState());

  Future<void> login(String username, String password) async {
    emit(AuthenticateLoadingState());
    try {
      final result = await _loginUsecase.call(params: LoginParams(username: username, password: password));
      result.fold(
        (l) {
          emit(AuthenticateErrorState(l.message.toString()));
        },
        (r) async {
          await _sharedPreferenceService.saveToken('access_token', r.data['access_token']);
          await _sharedPreferenceService.saveToken('refresh_token', r.data['refresh_token']);
          emit(AuthenticateSuccessState());
        },
      );
      emit(AuthenticateSuccessState());
    } catch (e) {
      emit(AuthenticateErrorState(e.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthenticateLoadingState());
    try {
      await _logoutUsecase.call();
      emit(AuthenticateLogoutState());
    } catch (e) {
      emit(AuthenticateErrorState(e.toString()));
    }
  }

  Future<void> register(String username, String email, String password) async {
    emit(AuthenticateLoadingState());
    try {
      final result = await _registerUsecase.call(params: RegisterParams(username: username, email: email, password: password));
      result.fold(
        (l) {
          log('message: ${l.message}');
          emit(AuthenticateErrorState(l.message.toString()));
        },
        (r) {
          emit(AuthenticateRegisterSuccessState());
        },
      );
    } catch (e) {
      log(e.toString());
      emit(AuthenticateErrorState(e.toString()));
    }
  }
}
