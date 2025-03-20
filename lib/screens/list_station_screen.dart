import 'package:flutter/material.dart';
import 'package:project/data_test/weather_test.dart';
import 'package:project/model/device.dart';
import 'package:project/pages/device_page.dart';

class ListStationScreen extends StatelessWidget {
  const ListStationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DeviceModel> list = listDevice;

    return Container(
      color: Color(0xFF1387DA).withValues(alpha: .1),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DevicePage(name: list[index].name)));
            },
            child: Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0xFF1387DA).withValues(alpha: .3)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      list[index].name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFF1387DA).withValues(alpha: .7),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/temperature.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                  Text(
                                    'Temperature',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Text(
                                '${list[index].weather.temperature}°C',
                                style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/check.png',
                                    height: 16,
                                    width: 16,
                                  ),
                                  Text(
                                    'Normal',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFF1387DA).withValues(alpha: .7),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/humidity.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                  Text(
                                    'Humidity',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Text(
                                '${list[index].weather.humidity}%',
                                style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/check.png',
                                    height: 16,
                                    width: 16,
                                  ),
                                  Text(
                                    'Normal',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFF1387DA).withValues(alpha: .7),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/moisture.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                  Text(
                                    'Moisture',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Text(
                                '${list[index].weather.moisture}%',
                                style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/check.png',
                                    height: 16,
                                    width: 16,
                                  ),
                                  Text(
                                    'Normal',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFF1387DA).withValues(alpha: .7),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/light.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                  Text(
                                    'Light',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Text(
                                '${list[index].weather.light}lux',
                                style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/check.png',
                                    height: 16,
                                    width: 16,
                                  ),
                                  Text(
                                    'Normal',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
