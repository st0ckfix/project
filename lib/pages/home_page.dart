import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project/bloc/device_list/device_cubit.dart';
import 'package:project/bloc/profile/profile_cubit.dart';
import 'package:project/bloc/schedule/schedule_cubit.dart';
import 'package:project/bloc/weather/weather_cubit.dart';
import 'package:project/screens/history_screen.dart';
import 'package:project/screens/home_screen.dart';
import 'package:project/screens/list_station_screen.dart';
import 'package:project/screens/profile_screen.dart';

final sl = GetIt.instance;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _bottomNavIndex;
  late List<(String, String)> _list;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();

    _bottomNavIndex = 0;
    _list = [
      ('Trang Chủ', 'assets/home.png'),
      ('Lặp Lịch', 'assets/calendar.png'),
      ('Lịch Sử', 'assets/history.png'),
      ('Tài Khoản', 'assets/solid_people.png'),
    ];

    _screens = [
      HomeScreen(),
      ListStationScreen(),
      HistoryScreen(),
      ProfileScreen(),
    ];
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(_list[_bottomNavIndex].$1),
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: _screens[_bottomNavIndex],
          );
        },
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return SizedBox(
      height: 80,
      width: 80,
      child: FittedBox(
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          onPressed: () {},
          shape: CircleBorder(),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Image.asset(
              'assets/bk.png',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return AnimatedBottomNavigationBar.builder(
      height: 65,
      itemCount: _list.length,
      tabBuilder: (index, isActive) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              _list[index].$2,
              width: 32,
              height: 32,
              color: isActive ? Color(0xFF042B90) : Colors.white,
            ),
            Text(
              _list[index].$1,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isActive ? Color(0xFF042B90) : Colors.white,
              ),
            ),
          ],
        );
      },
      activeIndex: _bottomNavIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.defaultEdge,
      leftCornerRadius: 12,
      rightCornerRadius: 12,
      onTap: (index) => setState(() => _bottomNavIndex = index),
      backgroundColor: Color(0xFF1487DA).withAlpha(153),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DeviceCubit>(
          create: (context) => DeviceCubit(sl(), sl(), sl()),
        ),
        BlocProvider<WeatherCubit>(
          create: (context) => WeatherCubit(sl(), sl()),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(sl(), sl()),
        ),
        BlocProvider<ScheduleCubit>(
          create: (context) => ScheduleCubit(sl(), sl(), sl(), sl()),
        ),
      ],
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        floatingActionButton: _buildFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }
}
