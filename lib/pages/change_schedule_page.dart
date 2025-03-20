import 'package:flutter/material.dart';
import 'package:project/model/schedule.dart';
import 'package:project/pages/repeat_schedule_page.dart';
import 'package:wheel_picker/wheel_picker.dart';
import 'package:project/widgets/schedule_option_row.dart';

class ChangeSchedulePage extends StatefulWidget {
  const ChangeSchedulePage({super.key, required this.scheduleModel});

  final ScheduleModel scheduleModel;

  @override
  State<ChangeSchedulePage> createState() => _ChangeSchedulePageState();
}

class _ChangeSchedulePageState extends State<ChangeSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sửa Scheduler'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Text(
            'Hủy',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Text(
              'Lưu',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 250,
                  width: 30,
                  child: WheelPicker(
                    itemCount: 24,
                    initialIndex: widget.scheduleModel.timeOfDay.hour - 1,
                    builder: (context, index) => Text(
                      (index < 9 ? '0' : '') + (index + 1).toString(),
                      style: TextStyle(fontSize: 22),
                    ),
                    selectedIndexColor: Color(0xFF1E90FF),
                    looping: true,
                    style: WheelPickerStyle(itemExtent: 25),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  height: 250,
                  width: 30,
                  child: WheelPicker(
                    itemCount: 59,
                    initialIndex: widget.scheduleModel.timeOfDay.minute - 1,
                    builder: (context, index) => Text(
                      (index < 9 ? '0' : '') + (index + 1).toString(),
                      style: TextStyle(fontSize: 22),
                    ),
                    selectedIndexColor: Color(0xFF1E90FF),
                    looping: true,
                    style: WheelPickerStyle(itemExtent: 25),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ScheduleOptionRow(
                    title: 'Lặp lại',
                    value: 'Hàng ngày',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RepeatSchedulePage(),
                      ),
                    ),
                  ),
                  Divider(),
                  ScheduleOptionRow(
                    title: 'Nhãn',
                    value: widget.scheduleModel.description,
                    onTap: () {},
                  ),
                  Divider(),
                  ScheduleOptionRow(
                    title: 'Âm thanh',
                    value: 'Hướng tâm',
                    onTap: () {},
                  ),
                  Divider(),
                  Row(
                    children: [
                      Text(
                        'Báo lại',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Switch(
                        value: true,
                        onChanged: (change) {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: Text(
                  'Xóa',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
