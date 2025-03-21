import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/model/device.dart';
import 'package:project/usecase/device_usecase.dart';

part 'device_list_state.dart';

class DeviceListCubit extends Cubit<DeviceListCubitState> {
  DeviceListCubit({required this.deviceUsecase})
      : super(DeviceListCubitInitial());

  final DeviceUsecase deviceUsecase;

  Future getDeviceData() async {
    if (state is DeviceListCubitLoaded) return;

    emit(DeviceListCubitLoading());
    final reponse = await deviceUsecase();
    reponse.fold(
      (l) {
        emit(DeviceListCubitError(l));
      },
      (r) {
        emit(DeviceListCubitLoaded(r));
      },
    );
  }
}
