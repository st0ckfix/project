part of 'device_cubit.dart';

abstract class DeviceState {}

class DeviceInitialState extends DeviceState {}

class DeviceLoadingState extends DeviceState {}

class DeviceAddingState extends DeviceState {}

class DeviceRemovingState extends DeviceState {}

class DeviceLoadedState extends DeviceState {
  final List<DeviceModel> devices;
  final List<WeatherModel> weathers;
  DeviceLoadedState(this.devices, this.weathers);
}

class DeviceErrorState extends DeviceState {
  final String message;
  DeviceErrorState(this.message);
}
