import 'package:flutter/material.dart';
import 'package:project/data_test/schedule_test.dart';
import 'package:project/pages/change_schedule_page.dart';

class DevicePage extends StatelessWidget {
  const DevicePage({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final list = listSchedule;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/add.png'),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeSchedulePage())),
              title: Text(
                list[index].timeOfDay.format(context).replaceFirst('AM', '').replaceFirst('PM', ''),
                style: TextStyle(fontSize: 48),
              ),
              subtitle: Text(
                list[index].description,
                style: TextStyle(fontSize: 22),
              ),
              trailing: Transform.scale(
                  scale: 1.5,
                  child: Switch.adaptive(
                    value: list[index].isDone,
                    onChanged: (boolean) {},
                  )),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: list.length,
        ),
      ),
    );
  }
}
