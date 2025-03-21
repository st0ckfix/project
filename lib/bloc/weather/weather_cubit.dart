import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/model/weather.dart';
import 'package:project/usecase/weather_usecase.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherCubitState> {
  WeatherCubit({required this.weatherUsecase}) : super(WeatherCubitInitial());

  final WeatherUsecase weatherUsecase;

  void getWeatherData() async {
    if (state is WeatherCubitLoaded) return;

    emit(WeatherCubitLoading());
    final reponse = await weatherUsecase();
    reponse.fold(
      (l) {
        emit(WeatherCubitError(l));
      },
      (r) {
        emit(WeatherCubitLoaded(r));
      },
    );
  }
}
