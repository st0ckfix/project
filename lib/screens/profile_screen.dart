import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/authenticate/authenticate_cubit.dart';
import 'package:project/bloc/user/user_cubit.dart';
import 'package:project/model/user.dart';
import 'package:project/widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserModel?>(
      builder: (context, user) {
        if (user == null) {
          return const Center(child: Text('No user'));
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                user!.avatar,
              ),
              minRadius: 120,
            ),
            Text(
              user.name,
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
                BlocProvider.of<UserCubit>(context).pushUser(null);
              },
            )
          ],
        );
      },
    );
  }
}
