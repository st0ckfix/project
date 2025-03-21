import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:project/bloc/authenticate/authenticate_cubit.dart';
import 'package:project/bloc/device_list/device_list_cubit.dart';
import 'package:project/bloc/history/history_cubit.dart';
import 'package:project/bloc/user/user_cubit.dart';
import 'package:project/bloc/weather/weather_cubit.dart';
import 'package:project/data_source/authenticate.dart';
import 'package:project/data_source/device_data.dart';
import 'package:project/data_source/history_data.dart';
import 'package:project/data_source/weather_data.dart';
import 'package:project/repository/authenticate_repository.dart';
import 'package:project/repository/device_repository.dart';
import 'package:project/repository/history_repository.dart';
import 'package:project/repository/weather_repository.dart';
import 'package:project/repository_impl/authenticate_repository_impl.dart';
import 'package:project/repository_impl/device_repository_impl.dart';
import 'package:project/repository_impl/history_repository_impl.dart';
import 'package:project/repository_impl/weather_repository_impl.dart';
import 'package:project/usecase/authenticate_usecase.dart';
import 'package:project/usecase/device_usecase.dart';
import 'package:project/usecase/history_usecase.dart';
import 'package:project/usecase/weather_usecase.dart';

final sl = GetIt.instance;

Future<void> initializedDI() async {
  sl.registerSingleton<Dio>(Dio());

  /*
  * Device
  */
  sl.registerSingleton<DeviceData>(DeviceData());
  sl.registerSingleton<DeviceRepository>(
      DeviceRepositoryImpl(deviceData: sl()));
  sl.registerSingleton<DeviceUsecase>(DeviceUsecase(deviceRepository: sl()));
  sl.registerSingleton<DeviceListCubit>(DeviceListCubit(deviceUsecase: sl()));

  /*
  * History
  */
  sl.registerSingleton<HistoryData>(HistoryData());
  sl.registerSingleton<HistoryRepository>(
      HistoryRepositoryImpl(historyData: sl()));
  sl.registerSingleton<HistoryUsecase>(HistoryUsecase(historyRepository: sl()));
  sl.registerSingleton<HistoryCubit>(HistoryCubit(historyUsecase: sl()));

  /*
  * Weather
  */
  sl.registerSingleton<WeatherData>(WeatherData());
  sl.registerSingleton<WeatherRepository>(
      WeatherRepositoryImpl(weatherData: sl()));
  sl.registerSingleton<WeatherUsecase>(WeatherUsecase(weatherRepository: sl()));
  sl.registerSingleton<WeatherCubit>(WeatherCubit(weatherUsecase: sl()));

  /*
  * Authenticate
  */
  sl.registerSingleton<Authenticate>(Authenticate());
  sl.registerSingleton<AuthenticateRepository>(
      AuthenticateRepositoryImpl(authenticate: sl()));
  sl.registerSingleton<AuthenticateUsecase>(
      AuthenticateUsecase(authenticate: sl()));
  sl.registerSingleton<AuthenticateCubit>(
      AuthenticateCubit(authenticateUsecase: sl()));

  /*
  * User
  */
  sl.registerSingleton<UserCubit>(UserCubit());
}
