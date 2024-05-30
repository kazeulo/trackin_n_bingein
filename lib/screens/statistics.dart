import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Statistics extends StatelessWidget {
  const Statistics({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 35.0, right: 15.0),
        child: ListView(
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "lib/assets/placeholder_profile.jpg",
                        fit: BoxFit.cover,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    SizedBox(width: 10),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Kzlyr",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: ", your media consumption",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "lib/assets/banner1.png",
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25, right: 25),
                        child: Text(
                          "Statistics",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: PieChartWidget(),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: generateLegends(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> generateLegends() {
    return [
      LegendItem(label: "Books", color: Color.fromARGB(255, 122, 195, 255), value: 25),
      LegendItem(label: "Movies", color: Color.fromARGB(255, 255, 135, 126), value: 19),
      LegendItem(label: "Podcasts", color: Color.fromRGBO(255, 241, 119, 1), value: 3),
      LegendItem(label: "Games", color: Color.fromARGB(255, 231, 124, 255), value: 45),
      LegendItem(label: "Social Media", color: Color.fromARGB(255, 191, 255, 175), value: 10),
    ];
  }
}

class LegendItem extends StatelessWidget {
  final String label;
  final Color color;
  final double value;

  const LegendItem({
    required this.label,
    required this.color,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            color: color,
          ),
          SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: PieChart(
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
      ),
    );
  }
}
