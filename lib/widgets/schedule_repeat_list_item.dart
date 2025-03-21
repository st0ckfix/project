import 'package:flutter/material.dart';

class RepeatScheduleListItem extends StatefulWidget {
  final String title;
  final bool isSelected;

  const RepeatScheduleListItem({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  State<RepeatScheduleListItem> createState() => _RepeatScheduleListItemState();
}

class _RepeatScheduleListItemState extends State<RepeatScheduleListItem> {
  late bool isSelected;
  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        isSelected = !isSelected;
        setState(() {});
      },
      title: Text(
        widget.title,
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
