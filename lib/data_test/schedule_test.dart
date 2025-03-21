import 'package:flutter/material.dart';
import 'package:project/model/schedule.dart';

final List<ScheduleModel> listSchedule = [
  ScheduleModel(
    description: 'Tưới Cây',
    timeOfDay: TimeOfDay(hour: 6, minute: 5),
    isDone: true,
    isRepat: true,
  ),
  ScheduleModel(
    description: 'Bón Phân',
    timeOfDay: TimeOfDay(hour: 8, minute: 10),
    isDone: true,
    isRepat: true,
  ),
  ScheduleModel(
    description: 'Kiểm Tra',
    timeOfDay: TimeOfDay(hour: 10, minute: 20),
    isDone: true,
    isRepat: true,
  ),
  ScheduleModel(
    description: 'Tưới Cây',
    timeOfDay: TimeOfDay(hour: 12, minute: 30),
    isDone: false,
    isRepat: true,
  ),
];

final List<ScheduleModel> listSchedule2 = [
  ScheduleModel(
    description: 'Tưới Cây',
    timeOfDay: TimeOfDay(hour: 7, minute: 8),
    isDone: true,
    isRepat: true,
  ),
  ScheduleModel(
    description: 'Bón Phân',
    timeOfDay: TimeOfDay(hour: 9, minute: 12),
    isDone: true,
    isRepat: true,
  ),
  ScheduleModel(
    description: 'Kiểm Tra',
    timeOfDay: TimeOfDay(hour: 11, minute: 19),
    isDone: true,
    isRepat: true,
  ),
  ScheduleModel(
    description: 'Tưới Cây',
    timeOfDay: TimeOfDay(hour: 13, minute: 25),
    isDone: false,
    isRepat: true,
  ),
];

final List<ScheduleModel> listSchedule3 = [
  ScheduleModel(
    description: 'Tưới Cây',
    timeOfDay: TimeOfDay(hour: 8, minute: 2),
    isDone: true,
    isRepat: true,
  ),
  ScheduleModel(
    description: 'Bón Phân',
    timeOfDay: TimeOfDay(hour: 10, minute: 1),
    isDone: true,
    isRepat: true,
  ),
  ScheduleModel(
    description: 'Kiểm Tra',
    timeOfDay: TimeOfDay(hour: 12, minute: 25),
    isDone: true,
    isRepat: true,
  ),
  ScheduleModel(
    description: 'Tưới Cây',
    timeOfDay: TimeOfDay(hour: 14, minute: 50),
    isDone: false,
    isRepat: true,
  ),
];

final List<ScheduleModel> listSchedule4 = [
  ScheduleModel(
    description: 'Tưới Cây',
    timeOfDay: TimeOfDay(hour: 9, minute: 15),
    isDone: true,
    isRepat: true,
  ),
  ScheduleModel(
    description: 'Bón Phân',
    timeOfDay: TimeOfDay(hour: 11, minute: 26),
    isDone: true,
    isRepat: true,
  ),
  ScheduleModel(
    description: 'Kiểm Tra',
    timeOfDay: TimeOfDay(hour: 13, minute: 29),
    isDone: true,
    isRepat: true,
  ),
  ScheduleModel(
    description: 'Tưới Cây',
    timeOfDay: TimeOfDay(hour: 15, minute: 31),
    isDone: false,
    isRepat: true,
  ),
];
