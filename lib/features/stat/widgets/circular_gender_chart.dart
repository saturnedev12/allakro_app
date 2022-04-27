import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircularGenderChart extends StatelessWidget {
  const CircularGenderChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCircularChart(
        title: ChartTitle(
            text: 'Genre Habitant',
            backgroundColor: Colors.white,
            borderColor: Colors.black,
            borderWidth: 0.5,

            // Aligns the chart title to left
            alignment: ChartAlignment.near,
            textStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontStyle: FontStyle.italic,
              fontSize: 14,
            )),
        legend: Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(
          enable: true,
        ),
        // Initialize category axis
        series: <CircularSeries>[
          // Render pie chart
          PieSeries<Genre, String>(
              dataSource: [
                Genre(
                  'Homme',
                  58,
                ),
                Genre('Femme', 42, Colors.purpleAccent),
                Genre('Indéterminé', 0, Colors.blueAccent)
              ],
              enableTooltip: true,
              dataLabelMapper: (Genre data, _) => data.genre,
              xValueMapper: (Genre data, _) => data.genre,
              yValueMapper: (Genre data, _) => data.value,
              pointColorMapper: (Genre data, _) => data.color,
              dataLabelSettings: DataLabelSettings(isVisible: true))
        ],
      ),
    );
  }
}

class Genre {
  Genre(this.genre, this.value, [this.color]);
  final String genre;
  final double value;
  final Color? color;
}
