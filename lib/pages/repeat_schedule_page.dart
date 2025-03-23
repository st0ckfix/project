import 'package:flutter/material.dart';
import 'package:project/widgets/schedule_repeat_list_item.dart';

class RepeatSchedulePage extends StatefulWidget {
  const RepeatSchedulePage({super.key, required this.repeatList});

  final List<bool> repeatList;

  @override
  State<RepeatSchedulePage> createState() => _RepeatSchedulePageState();
}

class _RepeatSchedulePageState extends State<RepeatSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lặp lại'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return RepeatScheduleListItem(
              title: 'Mọi ${index == 6 ? 'Chủ Nhật' : 'Thứ ${index + 2}'}',
              isSelected: widget.repeatList[index],
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: 7,
        ),
      ),
    );
  }
}
