import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReadingChart extends StatelessWidget {
  const ReadingChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCircularChart(
        title: ChartTitle(
            text: 'Personne sachant lire',
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
                _Genre('OUI', 510),
                _Genre('NON', 304),
                _Genre('Indéterminé', 2),
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
