import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:project/data_test/weather_test.dart';
import 'package:project/model/weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _index;
  late List<WeatherModel> _list;
  late List<Color> _colors;

  @override
  void initState() {
    super.initState();

    _index = 0;
    _list = listWeather;

    _colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.purple,
    ];
  }

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Container(
              height: 200,
              width: 200,
              color: _colors[_index],
            ),
          ),
          Text(
            _list[_index].description,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Text(
            '${_list[_index].temperature.toStringAsFixed(0)}°',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 48,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 80,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate([18, 19, 24, 25, 26].length, (index) => FlSpot(index.toDouble(), [18.0, 19.0, 24.0, 25.0, 26.0][index])),
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
          ),
          SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _list.indexed.map((item) {
                  bool isSelected = item.$1 == _index;
                  String time = item.$2.time <= 12 ? '${item.$2.time}AM' : '${item.$2.time - 1}PM';
                  String temperature = '${item.$2.temperature.toStringAsFixed(0)}°';
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _index = item.$1;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.all(5),
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
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 5),
                          Image.asset(
                            item.$2.icon,
                            height: 36,
                            width: 36,
                          ),
                          SizedBox(height: 5),
                          Text(
                            temperature,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              )

              // child: ListView.builder(
              //   scrollDirection: Axis.horizontal,
              //   itemCount: _list.length,
              //   itemBuilder: (context, index) {
              //     bool isSelected = index == _index;
              //     String time = _list[index].time <= 12
              //         ? '${_list[index].time}AM'
              //         : '${_list[index].time - 1}PM';
              //     String temperature =
              //         '${_list[index].temperature.toStringAsFixed(0)}°';
              //     return GestureDetector(
              //       onTap: () {
              //         setState(() {
              //           _index = index;
              //         });
              //       },
              //       child: AnimatedContainer(
              //         duration: Duration(milliseconds: 300),
              //         margin: EdgeInsets.symmetric(horizontal: 5),
              //         padding: EdgeInsets.all(10),
              //         decoration: BoxDecoration(
              //           color:
              //               isSelected ? Colors.grey.shade300 : Colors.transparent,
              //           borderRadius: BorderRadius.circular(20),
              //           border: Border.all(
              //             color: isSelected
              //                 ? Colors.grey.shade300
              //                 : Colors.transparent,
              //           ),
              //         ),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text(
              //               time,
              //               style: TextStyle(fontSize: 18),
              //             ),
              //             SizedBox(height: 5),
              //             Image.asset(
              //               _list[index].icon,
              //               height: 36,
              //               width: 36,
              //             ),
              //             SizedBox(height: 5),
              //             Text(
              //               temperature,
              //               style: TextStyle(fontSize: 18),
              //             ),
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // ),
              ),
        ],
      ),
    );
  }
}
