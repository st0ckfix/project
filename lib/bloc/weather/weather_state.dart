part of 'weather_cubit.dart';

abstract class WeatherCubitState extends Equatable {
  const WeatherCubitState();

  @override
  List<Object> get props => [];
}

final class WeatherCubitInitial extends WeatherCubitState {}

final class WeatherCubitLoading extends WeatherCubitState {}

final class WeatherCubitLoaded extends WeatherCubitState {
  const WeatherCubitLoaded(this.weatherList);
  final List<WeatherModel> weatherList;

  @override
  List<Object> get props => [weatherList];
}

final class WeatherCubitError extends WeatherCubitState {
  const WeatherCubitError(this.error);
  final DioException error;

  @override
  List<Object> get props => [error];
}
