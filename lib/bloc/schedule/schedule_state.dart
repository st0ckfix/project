part of 'schedule_cubit.dart';

abstract class ScheduleState {}

class ScheduleInitialState extends ScheduleState {}

class ScheduleLoadingState extends ScheduleState {}

class ScheduleActionInProgressState extends ScheduleState {}

class ScheduleLoadedState extends ScheduleState {
  final List<ScheduleModel> schedules;
  ScheduleLoadedState(this.schedules);
}

class ScheduleErrorState extends ScheduleState {
  final String message;
  ScheduleErrorState(this.message);
}
