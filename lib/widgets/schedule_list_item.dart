import 'package:flutter/material.dart';
import 'package:project/model/schedule.dart';

class ScheduleListItem extends StatelessWidget {
  final ScheduleModel schedule;
  final VoidCallback onTap;

  const ScheduleListItem({
    super.key,
    required this.schedule,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        schedule.timeOfDay
            .format(context)
            .replaceFirst('AM', '')
            .replaceFirst('PM', ''),
        style: TextStyle(fontSize: 48),
      ),
      subtitle: Text(
        schedule.description,
        style: TextStyle(fontSize: 22),
      ),
      trailing: Transform.scale(
        scale: 1.5,
        child: Switch.adaptive(
          value: schedule.isDone,
          onChanged: (boolean) {},
        ),
      ),
    );
  }
}
