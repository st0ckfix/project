import 'package:flutter/material.dart';

class ScheduleModel {
  final String deviceId;
  final String scheduleId;
  final String description;
  final TimeOfDay timeOfDay;
  final List<bool> repeatList;
  final bool isSnooze;
  final bool isRepeat;

  ScheduleModel({
    required this.deviceId,
    required this.scheduleId,
    required this.description,
    required this.timeOfDay,
    required this.repeatList,
    required this.isRepeat,
    required this.isSnooze,
  });

  ScheduleModel copyWith({
    String? description,
    TimeOfDay? timeOfDay,
    List<bool>? repeatList,
    bool? isRepeat,
    bool? isSnooze,
  }) {
    return ScheduleModel(
      deviceId: deviceId,
      scheduleId: scheduleId,
      description: description ?? this.description,
      timeOfDay: timeOfDay ?? this.timeOfDay,
      repeatList: repeatList ?? this.repeatList,
      isRepeat: isRepeat ?? this.isRepeat,
      isSnooze: isSnooze ?? this.isSnooze,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'device_id': deviceId,
      'schedule_id': scheduleId,
      'description': description,
      'hour': timeOfDay.hour,
      'minute': timeOfDay.minute,
      'repeat_list': repeatList,
      'is_repat': isRepeat,
      'is_snooze': isSnooze,
    };
  }

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      deviceId: json['device_id'],
      scheduleId: json['schedule_id'],
      description: json['description'],
      timeOfDay: TimeOfDay(
        hour: int.parse(json['hour']),
        minute: int.parse(json['minute']),
      ),
      repeatList: json['repeat_list'],
      isRepeat: json['is_repat'],
      isSnooze: json['is_snooze'],
    );
  }
}
