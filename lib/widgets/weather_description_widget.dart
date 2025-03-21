import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WeatherDescriptionWidget extends StatelessWidget {
  final String description;
  final bool isLoading;

  const WeatherDescriptionWidget({
    super.key,
    required this.description,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? _buildShimmer()
        : Text(
            description,
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: Container(
        height: 24,
        width: 200,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  factory WeatherDescriptionWidget.shimmer() {
    return WeatherDescriptionWidget(
      description: '',
      isLoading: true,
    );
  }
}
