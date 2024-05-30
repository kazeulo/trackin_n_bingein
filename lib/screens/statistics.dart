import 'package:flutter/material.dart';  
import 'package:fl_chart/fl_chart.dart';
import 'package:trackin_n_bingein/styling/styling.dart';

class Statistics extends StatelessWidget {
  const Statistics({Key? key}) : super(key: key);

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
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Kzlyr",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Styling.textColor3,
                            ),
                          ),
                          TextSpan(
                            text: ", your media consumption",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Styling.textColor3,
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
                        padding: const EdgeInsets.only(top: 25, right: 25),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Center(
                          child: Text(
                            "Here is the summary of the media you've consumed this week.",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                        SizedBox(height: 20),
                        ...generateLinearIndicators(),
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
      LegendItem(label: "Books", color: Color.fromARGB(255, 122, 195, 255)),
      LegendItem(label: "Movies", color: Color.fromARGB(255, 255, 135, 126)),
      LegendItem(label: "Podcasts", color: Color.fromRGBO(255, 241, 119, 1)),
      LegendItem(label: "Games", color: Color.fromARGB(255, 231, 124, 255)),
      LegendItem(label: "Social Media", color: Color.fromARGB(255, 191, 255, 175)),
    ];
  }

  List<Widget> generateLinearIndicators() {
    final List<String> categories = ["Books", "Movies", "Podcasts", "Games", "Social Media"];
    final List<double> percentages = [25, 19, 3, 45, 10];
    final List<Color> colors = [
      Color.fromARGB(255, 122, 195, 255),
      Color.fromARGB(255, 255, 135, 126),
      Color.fromRGBO(255, 241, 119, 1),
      Color.fromARGB(255, 231, 124, 255),
      Color.fromARGB(255, 191, 255, 175),
    ];

    List<Widget> indicators = [];
    for (int i = 0; i < categories.length; i++) {
      indicators.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Text(
                categories[i],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[300],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: LinearProgressIndicator(
                      value: percentages[i] / 100,
                      backgroundColor: Colors.transparent,
                      valueColor: AlwaysStoppedAnimation<Color>(colors[i]),
                      minHeight: 8,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text('${percentages[i].toStringAsFixed(0)}%'),
            ],
          ),
        ),
      );
    }

    return indicators;
  }
}

class LegendItem extends StatelessWidget {
  final String label;
  final Color color;

  const LegendItem({
    required this.label,
    required this.color,
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
