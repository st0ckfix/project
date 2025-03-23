import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/schedule/schedule_cubit.dart';
import 'package:project/model/device.dart';
import 'package:project/model/schedule.dart';
import 'package:project/pages/change_schedule_page.dart';
import 'package:project/widgets/schedule_list_item.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({super.key, required this.deviceModel});

  final DeviceModel deviceModel;

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  Widget _buildDataWidget(List<ScheduleModel> schedules) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView.separated(
        itemBuilder: (context, index) {
          ScheduleModel schedule = schedules[index];
          return ScheduleListItem(
            schedule: schedule,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeSchedulePage(
                    scheduleModel: schedule,
                  ),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: schedules.length,
      ),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Text('No schedule'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.deviceModel.deviceName,
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
                    deviceId: widget.deviceModel.deviceId,
                    scheduleId: (Random().nextInt(8999) + 1000).toString(),
                    description: '',
                    timeOfDay: TimeOfDay.now(),
                    repeatList: [],
                    isRepeat: true,
                    isSnooze: true,
                  ),
                ),
              ),
            ),
            icon: Image.asset('assets/add.png'),
          ),
        ],
      ),
      body: BlocBuilder<ScheduleCubit, ScheduleState>(
        builder: (context, state) {
          if (state is ScheduleLoadedState) {
            return state.schedules.isEmpty ? _buildEmpty() : _buildDataWidget(state.schedules);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
