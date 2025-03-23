import 'package:flutter/material.dart';
import 'package:project/model/schedule.dart';

class ScheduleListItem extends StatefulWidget {
  final ScheduleModel schedule;
  final Function onTap;

  const ScheduleListItem({
    super.key,
    required this.schedule,
    required this.onTap,
  });

  @override
  State<ScheduleListItem> createState() => _ScheduleListItemState();
}

class _ScheduleListItemState extends State<ScheduleListItem> {
  late bool isRepeat;
  late ScheduleModel schedule;

  @override
  void initState() {
    super.initState();
    schedule = widget.schedule;
    isRepeat = schedule.isRepeat;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => widget.onTap(),
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
        child: Switch(
          value: isRepeat,
          onChanged: (boolean) {
            setState(() {
              isRepeat = boolean;
            });
          },
        ),
      ),
    );
  }
}
