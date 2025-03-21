import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project/model/weather.dart';
import 'package:shimmer/shimmer.dart';

class WeatherCarouselWidget extends StatefulWidget {
  final List<WeatherModel> weatherList;
  final int initialIndex;
  final Function(int) onIndexChanged;
  final bool isLoading;
  const WeatherCarouselWidget({
    super.key,
    required this.weatherList,
    required this.initialIndex,
    required this.onIndexChanged,
    this.isLoading = false,
  });

  @override
  State<WeatherCarouselWidget> createState() => _WeatherCarouselWidgetState();

  factory WeatherCarouselWidget.shimmer() {
    return WeatherCarouselWidget(
      weatherList: [],
      initialIndex: 0,
      onIndexChanged: (_) {},
      isLoading: true,
    );
  }
}

class _WeatherCarouselWidgetState extends State<WeatherCarouselWidget> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return widget.isLoading ? _buildShimmer() : _buildCarousel();
  }

  Widget _buildCarousel() {
    return Container(
      height: 200,
      padding: EdgeInsets.all(10),
      child: CarouselSlider.builder(
        itemCount: widget.weatherList.length,
        options: CarouselOptions(
          viewportFraction: 0.25,
          initialPage: _currentIndex,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          enlargeFactor: 0.1,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
            widget.onIndexChanged(index);
          },
        ),
        itemBuilder: (context, index, realIndex) {
          WeatherModel weather = widget.weatherList[index];
          bool isSelected = index == _currentIndex;
          String time = weather.time <= 12
              ? '${weather.time}AM'
              : '${weather.time - 12}PM';
          String temperature = '${weather.temperature.toStringAsFixed(0)}°';

          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 4),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.grey.shade300 : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? Colors.grey.shade300 : Colors.transparent,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontSize: isSelected ? 18 : 16,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                SizedBox(height: 8),
                Image.asset(
                  weather.icon,
                  height: isSelected ? 40 : 32,
                  width: isSelected ? 40 : 32,
                ),
                SizedBox(height: 8),
                Text(
                  temperature,
                  style: TextStyle(
                    fontSize: isSelected ? 18 : 16,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildShimmer() {
    return Container(
      height: 200,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          4,
          (index) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white,
            child: Container(
              width: 70,
              height: 120,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
