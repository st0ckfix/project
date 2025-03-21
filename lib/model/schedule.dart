import 'package:flutter/material.dart';

class ScheduleModel {
  final String description;
  final TimeOfDay timeOfDay;
  final bool isDone;
  final bool isRepat;

  ScheduleModel({
    required this.description,
    required this.timeOfDay,
    required this.isDone,
    required this.isRepat,
  });

  ScheduleModel copyWith({
    String? description,
    TimeOfDay? timeOfDay,
    bool? isDone,
    bool? isRepat,
  }) {
    return ScheduleModel(
      description: description ?? this.description,
      timeOfDay: timeOfDay ?? this.timeOfDay,
      isDone: isDone ?? this.isDone,
      isRepat: isRepat ?? this.isRepat,
    );
  }
}
