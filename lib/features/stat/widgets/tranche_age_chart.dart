import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TrancheAgeChart extends StatelessWidget {
  const TrancheAgeChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCircularChart(
        title: ChartTitle(
            text: "Tranche d’âge",
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
                _Genre('Entre 25 et 34 ans', 262),
                _Genre('Entre 35 et 44 ans', 191),
                _Genre('Entre 45 et 54 ans ', 92),
                _Genre('Entre 55 et 64 ans ', 54),
                _Genre('Moins de 24 ans ', 18),
                _Genre('Plus de 65 ans', 11),
                _Genre('Indéterminé', 47),
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
