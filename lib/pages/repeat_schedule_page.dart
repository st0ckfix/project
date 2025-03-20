import 'package:flutter/material.dart';

class RepeatSchedulePage extends StatefulWidget {
  const RepeatSchedulePage({super.key});

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
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                'Mọi ${index == 6 ? 'Chủ Nhật' : 'Thứ ${index + 2}'}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Checkbox(value: false, onChanged: (boolean) {}),
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
