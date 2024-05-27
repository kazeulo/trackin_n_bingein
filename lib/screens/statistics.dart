import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Statistics extends StatelessWidget{

  const Statistics ({super.key});

  @override
  Widget build(BuildContext context){
    return PieChart(
      PieChartData(sections: [
        PieChartSectionData(
          value: 20,
          color: Colors.blue
        ),
        PieChartSectionData(
          value: 20,
          color: Colors.red
        ),
        PieChartSectionData(
          value: 20,
          color: Colors.yellow
        ),
        PieChartSectionData(
          value: 20,
          color: Colors.blue
        )
      ])
    );
  }
}