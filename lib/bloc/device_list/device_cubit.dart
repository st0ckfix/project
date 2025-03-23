import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/model/device.dart';
import 'package:project/model/weather.dart';
import 'package:project/usecase/device/add_usecase.dart' as device;
import 'package:project/usecase/device/get_usecase.dart' as device;
import 'package:project/usecase/device/remove_usecase.dart' as device;

part 'device_state.dart';

class DeviceCubit extends Cubit<DeviceState> {
  final device.AddUsecase _addUsecase;
  final device.GetUsecase _getUsecase;
  final device.RemoveUsecase _removeUsecase;

  DeviceCubit(this._addUsecase, this._getUsecase, this._removeUsecase) : super(DeviceInitialState());

  Future<void> getDevices() async {
    emit(DeviceLoadingState());
    try {
      final result = await _getUsecase.call();
      result.fold(
        (l) {
          emit(DeviceErrorState(l.message.toString()));
        },
        (r) {
          emit(
            DeviceLoadedState(
              ((r.data)['devices'] as List)
                  .map(
                    (e) => DeviceModel.fromJson(e),
                  )
                  .toList(),
              ((r.data)['weathers'] as List)
                  .map(
                    (e) => WeatherModel.fromJson(e),
                  )
                  .toList(),
            ),
          );
        },
      );
    } catch (e) {
      emit(DeviceErrorState(e.toString()));
    }
  }

  Future<void> addDevice(DeviceModel deviceModel) async {
    final devices = (state as DeviceLoadedState).devices;
    final weathers = (state as DeviceLoadedState).weathers;
    emit(DeviceAddingState());
    try {
      final result = await _addUsecase.call(params: device.AddParams(deviceName: deviceModel.deviceName, location: deviceModel.location));
      result.fold(
        (l) {
          emit(
            DeviceErrorState(
              l.message.toString(),
            ),
          );
        },
        (r) {
          emit(
            DeviceLoadedState(
              devices
                ..add(
                  deviceModel,
                ),
              weathers
                ..add(
                  WeatherModel.fromJson(
                    r.data,
                  ),
                ),
            ),
          );
        },
      );
    } catch (e) {
      emit(DeviceErrorState(e.toString()));
    }
  }

  Future<void> removeDevice(String deviceId) async {
    final devices = (state as DeviceLoadedState).devices;
    final weathers = (state as DeviceLoadedState).weathers;
    emit(DeviceRemovingState());
    try {
      final result = await _removeUsecase.call(params: deviceId);
      result.fold(
        (l) {
          emit(DeviceErrorState(l.message.toString()));
        },
        (r) {
          final index = devices.indexWhere((element) => element.deviceId == deviceId);
          emit(
            DeviceLoadedState(
              devices..removeAt(index),
              weathers..removeAt(index),
            ),
          );
        },
      );
      getDevices(); // Refresh list after removing
    } catch (e) {
      emit(DeviceErrorState(e.toString()));
    }
  }
}
