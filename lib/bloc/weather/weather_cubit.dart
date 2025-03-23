import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/model/history.dart';
import 'package:project/model/weather.dart';
import 'package:project/usecase/weather/get_usecase.dart' as weather;
import 'package:project/usecase/weather/history_usecase.dart' as weather;

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final weather.GetUsecase _getUsecase;
  final weather.HistoryUsecase _historyUsecase;

  WeatherCubit(this._getUsecase, this._historyUsecase) : super(WeatherInitialState());

  Future<void> getWeather() async {
    emit(WeatherLoadingState());
    try {
      final result = await _getUsecase.call();
      result.fold(
        (l) {
          emit(
            WeatherErrorState(
              l.message.toString(),
            ),
          );
        },
        (r) {
          final weatherData = (r.data as List)
              .map(
                (e) => WeatherModel.fromJson(e),
              )
              .toList();
          emit(WeatherLoadedState(weatherData));
        },
      );
    } catch (e) {
      emit(WeatherErrorState(e.toString()));
    }
  }

  Future<void> getWeatherHistory() async {
    emit(WeatherHistoryLoadingState());
    try {
      final result = await _historyUsecase.call();
      result.fold(
        (l) {
          emit(WeatherErrorState(l.message.toString()));
        },
        (r) {
          final historyData = (r.data as List)
              .map(
                (e) => HistoryModel.fromJson(e),
              )
              .toList();
          emit(WeatherHistoryLoadedState(historyData));
        },
      );
    } catch (e) {
      emit(WeatherErrorState(e.toString()));
    }
  }
}
