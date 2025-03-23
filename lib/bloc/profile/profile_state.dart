part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileUpdatingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final UserModel userModel;
  ProfileLoadedState(this.userModel);
}

class ProfileErrorState extends ProfileState {
  final String message;
  ProfileErrorState(this.message);
}
