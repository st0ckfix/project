import 'package:flutter/material.dart';

class RepeatScheduleListItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  const RepeatScheduleListItem({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: isSelected
          ? Icon(
              Icons.check,
              color: Colors.green,
            )
          : SizedBox.shrink(),
    );
  }
}
