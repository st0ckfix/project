part of 'history_cubit.dart';

abstract class HistoryCubitState extends Equatable {
  const HistoryCubitState();

  @override
  List<Object> get props => [];
}

final class HistoryCubitInitial extends HistoryCubitState {}

final class HistoryCubitLoading extends HistoryCubitState {}

final class HistoryCubitLoaded extends HistoryCubitState {
  const HistoryCubitLoaded(this.historyList);
  final List<HistoryModel> historyList;

  @override
  List<Object> get props => [historyList];
}

final class HistoryCubitError extends HistoryCubitState {
  const HistoryCubitError(this.error);
  final DioException error;

  @override
  List<Object> get props => [error];
}
