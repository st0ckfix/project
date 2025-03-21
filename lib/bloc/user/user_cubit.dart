import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/model/user.dart';

class UserCubit extends Cubit<UserModel?> {
  UserCubit() : super(null);

  Future pushUser(UserModel? user) async => emit(user);

  UserModel? getUser() => state;
}
