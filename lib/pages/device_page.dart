import 'package:flutter/material.dart';
import 'package:project/model/device.dart';
import 'package:project/model/schedule.dart';
import 'package:project/pages/change_schedule_page.dart';
import 'package:project/widgets/schedule_list_item.dart';

class DevicePage extends StatelessWidget {
  const DevicePage({super.key, required this.deviceModel});

  final DeviceModel deviceModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          deviceModel.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangeSchedulePage(
                  scheduleModel: ScheduleModel(
                    description: '',
                    timeOfDay: TimeOfDay.now(),
                    isDone: false,
                  ),
                ),
              ),
            ),
            icon: Image.asset('assets/add.png'),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.separated(
          itemBuilder: (context, index) {
            final schedule = deviceModel.schedules![index];
            return ScheduleListItem(
              schedule: schedule,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeSchedulePage(
                    scheduleModel: schedule,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: deviceModel.schedules?.length ?? 0,
        ),
      ),
    );
  }
}
