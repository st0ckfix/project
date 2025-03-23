import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:project/bloc/authenticate/authenticate_cubit.dart';
import 'package:project/bloc/device_list/device_cubit.dart';
import 'package:project/bloc/profile/profile_cubit.dart';
import 'package:project/bloc/schedule/schedule_cubit.dart';
import 'package:project/bloc/weather/weather_cubit.dart';
import 'package:project/data_source/api_service.dart';
import 'package:project/repository/authenticate_repository.dart';
import 'package:project/repository/device_repository.dart';
import 'package:project/repository/profile_repository.dart';
import 'package:project/repository/schedule_repository.dart';
import 'package:project/repository/weather_repository.dart';
import 'package:project/repository_impl/authenticate_repository_impl.dart';
import 'package:project/repository_impl/device_repository_impl.dart';
import 'package:project/repository_impl/profile_repository_impl.dart';
import 'package:project/repository_impl/schedule_repository_impl.dart';
import 'package:project/repository_impl/weather_repository_impl.dart';
import 'package:project/service/dio.dart';
import 'package:project/service/sp.dart';
import 'package:project/usecase/authenticate/login_usecase.dart';
import 'package:project/usecase/authenticate/logout_usecase.dart';
import 'package:project/usecase/authenticate/register_usecase.dart';
import 'package:project/usecase/device/add_usecase.dart' as device;
import 'package:project/usecase/device/get_usecase.dart' as device;
import 'package:project/usecase/device/remove_usecase.dart' as device;
import 'package:project/usecase/profile/get_usecase.dart' as profile;
import 'package:project/usecase/profile/update_usecase.dart' as profile;
import 'package:project/usecase/schedule/add_usecase.dart' as schedule;
import 'package:project/usecase/schedule/get_usecase.dart' as schedule;
import 'package:project/usecase/schedule/remove_usecase.dart' as schedule;
import 'package:project/usecase/schedule/update_usecase.dart' as schedule;
import 'package:project/usecase/weather/get_usecase.dart' as weather;
import 'package:project/usecase/weather/history_usecase.dart' as weather;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initializedDI() async {
  sl.registerSingleton<Dio>(Dio());

  /*
  * Service
  */
  sl.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
  sl.registerSingleton<SharedPreferenceService>(SharedPreferenceService(sl()));
  sl.registerSingleton<DioService>(DioService(sl()));
  sl.registerSingleton<ApiService>(ApiService(sl()));

  /*
  * Device
  */
  sl.registerSingleton<DeviceRepository>(DeviceRepositoryImpl(sl()));
  sl.registerSingleton<device.AddUsecase>(device.AddUsecase(sl()));
  sl.registerSingleton<device.GetUsecase>(device.GetUsecase(sl()));
  sl.registerSingleton<device.RemoveUsecase>(device.RemoveUsecase(sl()));
  sl.registerSingleton<DeviceCubit>(DeviceCubit(sl(), sl(), sl()));

  /*
  * Authenticate
  */
  sl.registerSingleton<AuthenticateRepository>(AuthenticateRepositoryImpl(sl()));
  sl.registerSingleton<LoginUsecase>(LoginUsecase(sl()));
  sl.registerSingleton<LogoutUsecase>(LogoutUsecase(sl()));
  sl.registerSingleton<RegisterUsecase>(RegisterUsecase(sl()));
  sl.registerSingleton<AuthenticateCubit>(AuthenticateCubit(sl(), sl(), sl(), sl()));

  /*
  * Profile
  */
  sl.registerSingleton<ProfileRepository>(ProfileRepositoryImpl(sl()));
  sl.registerSingleton<profile.GetUsecase>(profile.GetUsecase(sl()));
  sl.registerSingleton<profile.UpdateUsecase>(profile.UpdateUsecase(sl()));
  sl.registerSingleton<ProfileCubit>(ProfileCubit(sl(), sl()));

  /*
  * Schedule
  */
  sl.registerSingleton<ScheduleRepository>(ScheduleRepositoryImpl(sl()));
  sl.registerSingleton<schedule.AddUsecase>(schedule.AddUsecase(sl()));
  sl.registerSingleton<schedule.GetUsecase>(schedule.GetUsecase(sl()));
  sl.registerSingleton<schedule.RemoveUsecase>(schedule.RemoveUsecase(sl()));
  sl.registerSingleton<schedule.UpdateUsecase>(schedule.UpdateUsecase(sl()));
  sl.registerSingleton<ScheduleCubit>(ScheduleCubit(sl(), sl(), sl(), sl()));

  /*
  * Weather
  */
  sl.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(sl()));
  sl.registerSingleton<weather.GetUsecase>(weather.GetUsecase(sl()));
  sl.registerSingleton<weather.HistoryUsecase>(weather.HistoryUsecase(sl()));
  sl.registerSingleton<WeatherCubit>(WeatherCubit(sl(), sl()));
}
