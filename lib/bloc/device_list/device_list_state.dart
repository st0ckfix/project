part of 'device_list_cubit.dart';

abstract class DeviceListCubitState extends Equatable {
  const DeviceListCubitState();

  @override
  List<Object> get props => [];
}

final class DeviceListCubitInitial extends DeviceListCubitState {}

final class DeviceListCubitLoading extends DeviceListCubitState {}

final class DeviceListCubitLoaded extends DeviceListCubitState {
  const DeviceListCubitLoaded(this.deviceList);
  final List<DeviceModel> deviceList;

  @override
  List<Object> get props => [deviceList];
}

final class DeviceListCubitError extends DeviceListCubitState {
  const DeviceListCubitError(this.error);
  final DioException error;

  @override
  List<Object> get props => [error];
}
