// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:project/data_test/history_test.dart';
// import 'package:project/model/history.dart';

// class HistoryData {
//   Future<Either<DioException, List<HistoryModel>>> getHistoryData() async {
//     try {
//       await Future.delayed(const Duration(seconds: 3));
//       return Right(listHistory);
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
