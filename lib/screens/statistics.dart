import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  const Statistics({Key? key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text('Hi helooo stat ni'),
        PieChartWidget(),
      ],
    );
  }
}

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      swapAnimationDuration: const Duration(milliseconds: 800),
      swapAnimationCurve: Curves.easeInOutQuint,
      PieChartData(
        sections: [
          PieChartSectionData(
            value: 25,
            color: const Color.fromARGB(255, 122, 195, 255),
          ),
          PieChartSectionData(
            value: 19,
            color: const Color.fromARGB(255, 255, 135, 126),
          ),
          PieChartSectionData(
            value: 3,
            color: Color.fromRGBO(255, 241, 119, 1),
          ),
          PieChartSectionData(
            value: 45,
            color: Color.fromARGB(255, 231, 124, 255),
          ),
          PieChartSectionData(
            value: 10,
            color: Color.fromARGB(255, 191, 255, 175),
          ),
        ],
      ),
    );
  }
}
