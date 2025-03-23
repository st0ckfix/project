// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:project/data_test/user_test.dart';
// import 'package:project/model/user.dart';

// class Authenticate {
//   Future<Either<DioException, Response>> login(
//       String username, String password) async {
//     try {
//       await Future.delayed(const Duration(seconds: 3));

//       late int id;

//       switch (username) {
//         case 'user1':
//           id = 1;
//           break;
//         case 'user2':
//           id = 2;
//           break;
//         case 'user3':
//           id = 3;
//           break;
//       }

//       final user = listUser.firstWhere((element) => element.id == id.toString(),
//           orElse: () => UserModel.empty());

//       if (user.id.isEmpty) {
//         return Left(
//           DioException(
//             requestOptions: RequestOptions(path: ''),
//             message: 'User not found',
//           ),
//         );
//       }

//       return Right(
//         Response(
//           requestOptions: RequestOptions(
//             path: '',
//           ),
//           data: user.toJson(),
//           statusCode: 200,
//         ),
//       );
//     } catch (e) {
//       return Left(
//         DioException(
//           requestOptions: RequestOptions(path: ''),
//           message: e.toString(),
//         ),
//       );
//     }
//   }
// }
