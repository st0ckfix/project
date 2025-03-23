import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/model/schedule.dart';
import 'package:project/usecase/schedule/add_usecase.dart' as schedule;
import 'package:project/usecase/schedule/get_usecase.dart' as schedule;
import 'package:project/usecase/schedule/remove_usecase.dart' as schedule;
import 'package:project/usecase/schedule/update_usecase.dart' as schedule;

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  final schedule.AddUsecase _addUsecase;
  final schedule.GetUsecase _getUsecase;
  final schedule.RemoveUsecase _removeUsecase;
  final schedule.UpdateUsecase _updateUsecase;

  ScheduleCubit(
    this._addUsecase,
    this._getUsecase,
    this._removeUsecase,
    this._updateUsecase,
  ) : super(ScheduleInitialState());

  Future<void> getSchedules() async {
    emit(ScheduleLoadingState());
    try {
      final result = await _getUsecase.call();
      result.fold(
        (l) {
          emit(
            ScheduleErrorState(
              l.message.toString(),
            ),
          );
        },
        (r) {
          final schedules = (r.data as List)
              .map(
                (e) => ScheduleModel.fromJson(e),
              )
              .toList();
          emit(ScheduleLoadedState(schedules));
        },
      );
    } catch (e) {
      emit(ScheduleErrorState(e.toString()));
    }
  }

  Future<void> addSchedule(String deviceId, ScheduleModel scheduleModel) async {
    final schedules = (state as ScheduleLoadedState).schedules;
    emit(ScheduleActionInProgressState());
    try {
      final result = await _addUsecase.call(
        params: schedule.AddParams(
          deviceId: deviceId,
          schedule: scheduleModel,
        ),
      );
      result.fold(
        (l) {
          emit(ScheduleErrorState(l.message.toString()));
        },
        (r) {
          emit(
            ScheduleLoadedState(
              schedules
                ..add(
                  scheduleModel,
                ),
            ),
          );
        },
      );
    } catch (e) {
      emit(ScheduleErrorState(e.toString()));
    }
  }

  Future<void> updateSchedule(String deviceId, ScheduleModel scheduleModel) async {
    final schedules = (state as ScheduleLoadedState).schedules;
    emit(ScheduleActionInProgressState());
    try {
      final result = await _updateUsecase.call(
        params: schedule.UpdateParams(
          deviceId: deviceId,
          schedule: scheduleModel,
        ),
      );
      result.fold(
        (l) {
          emit(
            ScheduleErrorState(
              l.message.toString(),
            ),
          );
        },
        (r) {
          emit(
            ScheduleLoadedState(
              schedules
                ..add(
                  scheduleModel,
                ),
            ),
          );
        },
      );
    } catch (e) {
      emit(ScheduleErrorState(e.toString()));
    }
  }

  Future<void> removeSchedule(String deviceId, String scheduleId) async {
    final schedules = (state as ScheduleLoadedState).schedules;
    emit(ScheduleActionInProgressState());
    try {
      final result = await _removeUsecase.call(
        params: schedule.RemoveParams(
          deviceId: deviceId,
          scheduleId: scheduleId,
        ),
      );
      result.fold(
        (l) {
          emit(
            ScheduleErrorState(
              l.message.toString(),
            ),
          );
        },
        (r) {
          emit(
            ScheduleLoadedState(
              schedules.where((element) => element.scheduleId != scheduleId).toList(),
            ),
          );
        },
      );
    } catch (e) {
      emit(ScheduleErrorState(e.toString()));
    }
  }
}
