// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:project/data_test/weather_test.dart';
// import 'package:project/model/weather.dart';

// class WeatherData {
//   Future<Either<DioException, List<WeatherModel>>> getWeatherData() async {
//     try {
//       await Future.delayed(const Duration(seconds: 3));
//       return Right(listWeather);
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
