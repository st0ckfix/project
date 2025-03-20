import 'package:flutter/material.dart';

class ScheduleOptionRow extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onTap;

  const ScheduleOptionRow({
    super.key,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        InkWell(
          onTap: onTap,
          child: Text(value),
        ),
        IconButton(
          onPressed: onTap,
          icon: Icon(
            Icons.arrow_forward_ios_sharp,
          ),
        ),
      ],
    );
  }
}
