import 'package:flutter/material.dart';
import 'package:project/model/schedule.dart';

final List<ScheduleModel> listSchedule = [
  ScheduleModel(description: 'Tưới Cây', timeOfDay: TimeOfDay(hour: 7, minute: 15), isDone: true),
  ScheduleModel(description: 'Tưới Cây', timeOfDay: TimeOfDay(hour: 9, minute: 15), isDone: true),
  ScheduleModel(description: 'Tưới Cây', timeOfDay: TimeOfDay(hour: 12, minute: 15), isDone: true),
  ScheduleModel(description: 'Tưới Cây', timeOfDay: TimeOfDay(hour: 15, minute: 15), isDone: false),
];
