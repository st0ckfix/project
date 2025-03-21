import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/model/user.dart';
import 'package:project/usecase/authenticate_usecase.dart';

part 'authenticate_state.dart';

class AuthenticateCubit extends Cubit<AuthenticateCubitState> {
  AuthenticateCubit({required this.authenticateUsecase})
      : super(AuthenticateCubitInitial());

  final AuthenticateUsecase authenticateUsecase;

  Future login(String username, String password) async {
    if (state is AuthenticateCubitLoaded) return;

    emit(AuthenticateCubitLoading());
    final reponse = await authenticateUsecase(params: (username, password));
    reponse.fold(
      (l) {
        emit(AuthenticateCubitError(l));
      },
      (r) {
        final user = UserModel.fromJson(r.data as Map<String, dynamic>);
        emit(AuthenticateCubitLoaded(user));
      },
    );
  }

  Future logout() async {
    emit(AuthenticateCubitInitial());
  }
}
