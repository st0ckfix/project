import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WeatherImageWidget extends StatelessWidget {
  final String imagePath;
  final bool isLoading;

  const WeatherImageWidget({
    super.key,
    required this.imagePath,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? _buildShimmer()
        : AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Image.asset(
              imagePath,
              key: ValueKey<String>(imagePath),
              height: 150,
              width: 150,
            ),
          );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  factory WeatherImageWidget.shimmer() {
    return WeatherImageWidget(
      imagePath: '',
      isLoading: true,
    );
  }
}
