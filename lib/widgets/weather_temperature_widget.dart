import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WeatherTemperatureWidget extends StatelessWidget {
  final double temperature;
  final bool isLoading;

  const WeatherTemperatureWidget({
    super.key,
    required this.temperature,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? _buildShimmer()
        : Text(
            '${temperature.toStringAsFixed(0)}°',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 48,
            ),
            textAlign: TextAlign.center,
          );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: Container(
        height: 48,
        width: 80,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  factory WeatherTemperatureWidget.shimmer() {
    return WeatherTemperatureWidget(
      temperature: 0,
      isLoading: true,
    );
  }
}
