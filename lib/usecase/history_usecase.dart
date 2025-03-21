import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/model/history.dart';
import 'package:project/repository/history_repository.dart';
import 'package:project/usecase/usecase.dart';

class HistoryUsecase
    implements UseCase<Either<DioException, List<HistoryModel>>, Null> {
  HistoryUsecase({required this.historyRepository});
  final HistoryRepository historyRepository;

  @override
  Future<Either<DioException, List<HistoryModel>>> call({Null params}) {
    return historyRepository.getHistoryData();
  }
}
