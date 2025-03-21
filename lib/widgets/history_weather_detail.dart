import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:project/model/weather.dart';

class HistoryWeatherDetail extends StatelessWidget {
  final WeatherModel? weather;
  final bool isLoading;

  const HistoryWeatherDetail({
    super.key,
    required this.weather,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading ? _buildShimmer() : _buildContent();
  }

  Widget _buildContent() {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(weather!.icon),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                "${weather!.description} xảy ra vào lúc ${weather!.time > 12 ? "${weather!.time - 12}PM" : "${weather!.time}AM"}",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }

  // Factory constructor for shimmer effect
  factory HistoryWeatherDetail.shimmer() {
    return HistoryWeatherDetail(
      weather: null,
      isLoading: true,
    );
  }
}
