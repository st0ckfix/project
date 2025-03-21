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

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'timeOfDay': '${timeOfDay.hour}:${timeOfDay.minute}',
      'isDone': isDone,
      'isRepat': isRepat,
    };
  }

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      description: json['description'],
      timeOfDay: TimeOfDay(
        hour: int.parse(json['timeOfDay'].split(':')[0]),
        minute: int.parse(json['timeOfDay'].split(':')[1]),
      ),
      isDone: json['isDone'],
      isRepat: json['isRepat'],
    );
  }
}
