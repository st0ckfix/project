import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project/model/schedule.dart';

class ScheduleListItem extends StatefulWidget {
  final ScheduleModel schedule;
  final Future<TimeOfDay?> Function() onTap;

  const ScheduleListItem({
    super.key,
    required this.schedule,
    required this.onTap,
  });

  @override
  State<ScheduleListItem> createState() => _ScheduleListItemState();
}

class _ScheduleListItemState extends State<ScheduleListItem> {
  late bool isDone;
  late ScheduleModel schedule;

  @override
  void initState() {
    super.initState();
    schedule = widget.schedule;
    isDone = widget.schedule.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        final newValue = await widget.onTap();
        log('New value: $newValue');
        if (newValue != null) {
          setState(() {
            schedule = schedule.copyWith(
              timeOfDay: newValue,
            );
          });
        }
      },
      title: Text(
        schedule.timeOfDay.format(context).replaceFirst('AM', '').replaceFirst('PM', ''),
        style: TextStyle(fontSize: 48),
      ),
      subtitle: Text(
        schedule.description,
        style: TextStyle(fontSize: 22),
      ),
      trailing: Transform.scale(
        scale: 1.5,
        child: Switch(
          value: isDone,
          onChanged: (boolean) {
            setState(() {
              isDone = boolean;
            });
          },
        ),
      ),
    );
  }
}
