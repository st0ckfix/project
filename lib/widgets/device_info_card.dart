import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DeviceInfoCard extends StatelessWidget {
  final String imagePath;
  final String label;
  final String value;
  final String status;
  final bool isLoading;

  const DeviceInfoCard({
    super.key,
    required this.imagePath,
    required this.label,
    required this.value,
    required this.status,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: isLoading ? _buildShimmerCard() : _buildDataCard(),
    );
  }

  Widget _buildShimmerCard() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Container(
                  height: 24,
                  width: 24,
                  color: Colors.white,
                ),
                SizedBox(width: 5),
                Container(
                  height: 14,
                  width: 80,
                  color: Colors.white,
                ),
              ],
            ),
            Container(
              height: 22,
              width: 60,
              color: Colors.white,
            ),
            Row(
              children: [
                Container(
                  height: 16,
                  width: 16,
                  color: Colors.white,
                ),
                SizedBox(width: 5),
                Container(
                  height: 14,
                  width: 60,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataCard() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
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
                overflow: TextOverflow.ellipsis,
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
    );
  }

  // Factory constructor to create loading cards
  factory DeviceInfoCard.shimmer() {
    return DeviceInfoCard(
      imagePath: '',
      label: '',
      value: '',
      status: '',
      isLoading: true,
    );
  }
}
