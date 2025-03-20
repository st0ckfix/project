import 'package:flutter/material.dart';

class DeviceInfoCard extends StatelessWidget {
  final String imagePath;
  final String label;
  final String value;
  final String status;

  const DeviceInfoCard({
    super.key,
    required this.imagePath,
    required this.label,
    required this.value,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xFF1387DA).withOpacity(0.7),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Image.asset(
                  imagePath,
                  height: 24,
                  width: 24,
                ),
                SizedBox(width: 5),
                Text(
                  label,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Image.asset(
                  'assets/check.png',
                  height: 16,
                  width: 16,
                ),
                SizedBox(width: 5),
                Text(
                  status,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
