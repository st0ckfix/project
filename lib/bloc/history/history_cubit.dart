import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/model/history.dart';
import 'package:project/usecase/history_usecase.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryCubitState> {
  HistoryCubit({required this.historyUsecase}) : super(HistoryCubitInitial());

  final HistoryUsecase historyUsecase;

  void getHistoryData() async {
    if (state is HistoryCubitLoaded) return;

    emit(HistoryCubitLoading());
    final reponse = await historyUsecase();
    reponse.fold(
      (l) {
        emit(HistoryCubitError(l));
      },
      (r) {
        emit(HistoryCubitLoaded(r));
      },
    );
  }
}
