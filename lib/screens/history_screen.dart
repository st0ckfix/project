import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/history/history_cubit.dart';
import 'package:project/model/history.dart';
import 'package:project/widgets/history_weather_detail.dart';
import 'package:shimmer/shimmer.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  Widget _buildDataWidget(List<HistoryModel> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final history = list[index];
        final dateDisplay = history.date.difference(DateTime.now()).inDays == 0
            ? "Hôm nay"
            : history.date.difference(DateTime.now()).inDays == -1
                ? "Hôm qua"
                : "${(history.date.difference(DateTime.now()).inDays).abs()} ngày trước";
        return ListTile(
          title: Text(dateDisplay),
          subtitle: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: history.weathers
                  .map((weather) => HistoryWeatherDetail(weather: weather))
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildError(String error) {
    return Center(
      child: Text(error),
    );
  }

  Widget _buildShimmer() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Shimmer for the date title
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.white,
                child: Container(
                  height: 20,
                  width: 120,
                  margin: EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              // Container with shimmer weather details
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: List.generate(
                    3, // Generate 3 shimmer weather details
                    (i) => HistoryWeatherDetail.shimmer(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HistoryCubit>(context).getHistoryData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryCubitState>(
      builder: (context, state) {
        if (state is HistoryCubitLoaded) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: _buildDataWidget(state.historyList),
          );
        } else if (state is HistoryCubitError) {
          return _buildError(state.error.message ?? "Có lỗi xảy ra");
        } else {
          return _buildShimmer();
        }
      },
    );
  }
}
