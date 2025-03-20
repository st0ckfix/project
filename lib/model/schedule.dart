import 'package:flutter/material.dart';

class ScheduleModel {
  final String description;
  final TimeOfDay timeOfDay;
  final bool isDone;

  ScheduleModel({
    required this.description,
    required this.timeOfDay,
    required this.isDone,
  });
}
