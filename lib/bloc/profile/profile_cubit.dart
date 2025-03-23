import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/model/user.dart';
import 'package:project/usecase/profile/get_usecase.dart' as profile;
import 'package:project/usecase/profile/update_usecase.dart' as profile;

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final profile.GetUsecase _getUsecase;
  final profile.UpdateUsecase _updateUsecase;

  ProfileCubit(this._getUsecase, this._updateUsecase) : super(ProfileInitialState());

  Future<void> getProfile() async {
    emit(ProfileLoadingState());
    try {
      final result = await _getUsecase.call();
      result.fold(
        (l) {
          emit(
            ProfileErrorState(
              l.message.toString(),
            ),
          );
        },
        (r) {
          emit(
            ProfileLoadedState(
              UserModel.fromJson(
                r.data,
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }

  Future<void> updateProfile(String firstName, String lastName, String avatar) async {
    final currentUser = (state as ProfileLoadedState).userModel;
    emit(ProfileUpdatingState());
    try {
      final result = await _updateUsecase.call(
        params: profile.UpdateParams(
          firstName: firstName,
          lastName: lastName,
          avatar: avatar,
        ),
      );
      result.fold(
        (l) {
          emit(ProfileErrorState(l.message.toString()));
        },
        (r) {
          emit(
            ProfileLoadedState(
              currentUser.copyWith(
                firstName: firstName,
                lastName: lastName,
                avatar: avatar,
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }
}
