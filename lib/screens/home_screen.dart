import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/weather/weather_cubit.dart';
import 'package:project/model/weather.dart';
import 'package:project/widgets/weather_carousel_widget.dart';
import 'package:project/widgets/weather_chart_widget.dart';
import 'package:project/widgets/weather_description_widget.dart';
import 'package:project/widgets/weather_image_widget.dart';
import 'package:project/widgets/weather_temperature_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = 3;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<WeatherCubit>(context).getWeather();
    });
  }

  Widget _buildDataWidget(List<WeatherModel> list) {
    final weatherModel = list[_index];
    final listWidget = [
      WeatherImageWidget(imagePath: weatherModel.image),
      WeatherDescriptionWidget(description: weatherModel.description),
      WeatherTemperatureWidget(temperature: weatherModel.temperature),
      WeatherChartWidget(temperatures: list.map((e) => e.temperature).toList()),
      WeatherCarouselWidget(
        weatherList: list,
        initialIndex: _index,
        onIndexChanged: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    ];

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFBCE8FF),
            Color(0xFFFFFFFF),
          ],
          stops: [0.0, 0.5],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return listWidget[index];
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 20);
        },
        itemCount: listWidget.length,
      ),
    );
  }

  Widget _buildShimmer() {
    final listWidget = [
      WeatherImageWidget.shimmer(),
      WeatherDescriptionWidget.shimmer(),
      WeatherTemperatureWidget.shimmer(),
      WeatherChartWidget.shimmer(),
      WeatherCarouselWidget.shimmer(),
    ];

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFBCE8FF),
            Color(0xFFFFFFFF),
          ],
          stops: [0.0, 0.5],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return listWidget[index];
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 20);
        },
        itemCount: listWidget.length,
      ),
    );
  }

  Widget _buildError(String error) {
    return Center(
      child: Text(error),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: _buildDataWidget(state.weatherData),
          );
        } else if (state is WeatherErrorState) {
          return _buildError(state.message);
        } else {
          return _buildShimmer();
        }
      },
    );
  }
}
