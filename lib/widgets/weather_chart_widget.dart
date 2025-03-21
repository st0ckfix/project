import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WeatherChartWidget extends StatelessWidget {
  final List<double> temperatures;
  final bool isLoading;

  const WeatherChartWidget({
    super.key,
    required this.temperatures,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading ? _buildShimmer() : _buildChart();
  }

  Widget _buildChart() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 80,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(temperatures.length,
                  (index) => FlSpot(index.toDouble(), temperatures[index])),
              isCurved: true,
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.orange],
              ),
              barWidth: 4,
              belowBarData: BarAreaData(show: false),
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  factory WeatherChartWidget.shimmer() {
    return WeatherChartWidget(
      temperatures: [],
      isLoading: true,
    );
  }
}
