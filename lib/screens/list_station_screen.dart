import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/device_list/device_list_cubit.dart';
import 'package:project/model/device.dart';
import 'package:project/pages/device_page.dart';
import 'package:project/widgets/device_info_card.dart';
import 'package:shimmer/shimmer.dart';

class ListStationScreen extends StatefulWidget {
  const ListStationScreen({super.key});

  @override
  State<ListStationScreen> createState() => _ListStationScreenState();
}

class _ListStationScreenState extends State<ListStationScreen> {
  Widget _buildError(String error) {
    return Center(
      child: Text(error),
    );
  }

  Widget _buildDataWidget(List<DeviceModel> list) {
    return Container(
      color: Color(0xFF1387DA).withValues(alpha: .1),
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
                color: Color(0xFF1387DA).withValues(alpha: .3),
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

  Widget _buildShimmer() {
    return Container(
      color: Color(0xFF1387DA).withOpacity(0.1),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFF1387DA).withOpacity(0.1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.white,
                    child: Container(
                      height: 24,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    DeviceInfoCard.shimmer(),
                    DeviceInfoCard.shimmer(),
                  ],
                ),
                Row(
                  children: [
                    DeviceInfoCard.shimmer(),
                    DeviceInfoCard.shimmer(),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DeviceListCubit>(context).getDeviceData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceListCubit, DeviceListCubitState>(
      builder: (context, state) {
        if (state is DeviceListCubitLoaded) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: _buildDataWidget(state.deviceList),
          );
        } else if (state is DeviceListCubitError) {
          return _buildError(
              state.error.message ?? "Có lỗi xảy ra, vui lòng thử lại sau");
        } else {
          return _buildShimmer();
        }
      },
    );
  }
}
