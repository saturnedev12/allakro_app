import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LevelSchoolChart extends StatelessWidget {
  const LevelSchoolChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCircularChart(
        title: ChartTitle(
            text: "Niveau d’étude",
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
          PieSeries<_Genre, String>(
              dataSource: [
                _Genre('Primaire', 212),
                _Genre('Niveau Tle', 29),
                _Genre('Niveau 2nd', 52),
                _Genre('Niveau 1èez', 11),
                _Genre('Moins que la 3ième', 137),
                _Genre('BAC+8', 1),
                _Genre('BAC+6', 2),
                _Genre('BAC+5', 2),
                _Genre('BAC+4', 9),
                _Genre('BAC+3', 16),
                _Genre('BAC+2', 28),
                _Genre('BAC+1', 8),
                _Genre('BAC', 30),
                _Genre('AUCUN', 244),
                _Genre('Indéterminé', 35),
              ],
              enableTooltip: true,
              dataLabelMapper: (_Genre data, _) => data.genre,
              xValueMapper: (_Genre data, _) => data.genre,
              yValueMapper: (_Genre data, _) => data.value,
              pointColorMapper: (_Genre data, _) => data.color,
              dataLabelSettings: DataLabelSettings(isVisible: true))
        ],
      ),
    );
  }
}

class _Genre {
  _Genre(this.genre, this.value, [this.color]);
  final String genre;
  final double value;
  final Color? color;
}
