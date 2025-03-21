import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/data_source/history_data.dart';
import 'package:project/model/history.dart';
import 'package:project/repository/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  HistoryRepositoryImpl({required this.historyData});
  final HistoryData historyData;
  @override
  Future<Either<DioException, List<HistoryModel>>> getHistoryData() {
    return historyData.getHistoryData();
  }
}
