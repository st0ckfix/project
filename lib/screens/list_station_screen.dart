import 'package:flutter/material.dart';
import 'package:project/data_test/device_test.dart';
import 'package:project/model/device.dart';
import 'package:project/pages/device_page.dart';
import 'package:project/widgets/device_info_card.dart';

class ListStationScreen extends StatelessWidget {
  const ListStationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DeviceModel> list = listDevice;

    return Container(
      color: Color(0xFF1387DA).withOpacity(0.1),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final device = list[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DevicePage(
                    deviceModel: device,
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF1387DA).withOpacity(0.3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      device.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      DeviceInfoCard(
                        imagePath: 'assets/temperature.png',
                        label: 'Temperature',
                        value:
                            '${device.weather.temperature.toStringAsFixed(0)}°C',
                        status: 'Normal',
                      ),
                      DeviceInfoCard(
                        imagePath: 'assets/humidity.png',
                        label: 'Humidity',
                        value: '${device.weather.humidity}%',
                        status: 'Normal',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      DeviceInfoCard(
                        imagePath: 'assets/moisture.png',
                        label: 'Moisture',
                        value: '${device.weather.moisture}%',
                        status: 'Normal',
                      ),
                      DeviceInfoCard(
                        imagePath: 'assets/light.png',
                        label: 'Light',
                        value: '${device.weather.light}lux',
                        status: 'Normal',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
