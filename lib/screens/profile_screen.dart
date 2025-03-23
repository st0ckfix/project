import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/authenticate/authenticate_cubit.dart';
import 'package:project/bloc/profile/profile_cubit.dart';
import 'package:project/widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileInitialState) {
          BlocProvider.of<ProfileCubit>(context).getProfile();
        }
        if (state is ProfileLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProfileErrorState) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is ProfileLoadedState) {
          final user = state.userModel;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  user.avatar,
                ),
                minRadius: 120,
              ),
              Text(
                '${user.firstName} ${user.lastName}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Log Out',
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  BlocProvider.of<AuthenticateCubit>(context).logout();
                },
              )
            ],
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
