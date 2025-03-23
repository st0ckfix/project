import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/data_source/api_service.dart';

abstract class BaseRepository {
  final ApiService apiService;

  BaseRepository(this.apiService);

  // Phương thức tiện ích chung có thể đặt ở đây
  Future<Either<DioException, T>> handleResponse<T>(
      Future<Either<DioException, Response>> Function() apiCall,
      T Function(Response) onSuccess) async {
    final response = await apiCall();
    return response.fold(
        (error) => Left(error), (data) => Right(onSuccess(data)));
  }
}
