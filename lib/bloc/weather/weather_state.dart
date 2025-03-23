part of 'weather_cubit.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherHistoryLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final List<WeatherModel> weatherData;
  WeatherLoadedState(this.weatherData);
}

class WeatherHistoryLoadedState extends WeatherState {
  final List<HistoryModel> historyData;
  WeatherHistoryLoadedState(this.historyData);
}

class WeatherErrorState extends WeatherState {
  final String message;
  WeatherErrorState(this.message);
}
