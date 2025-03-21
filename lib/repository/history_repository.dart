import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/model/history.dart';

abstract class HistoryRepository {
  Future<Either<DioException, List<HistoryModel>>> getHistoryData();
}
