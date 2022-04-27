import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class NationnalityChart extends StatelessWidget {
  const NationnalityChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCircularChart(
        title: ChartTitle(
            text: 'Nationnalités',
            backgroundColor: Colors.white,
            borderColor: Colors.black,
            borderWidth: 0.5,

            // Aligns the chart title to left
            alignment: ChartAlignment.near,
            textStyle: const TextStyle(
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
          PieSeries<Nationality, String>(
              dataSource: [
                Nationality('Béninoise', 6),
                Nationality('Burkinabè', 256),
                Nationality('Comorienne', 1),
                Nationality("Ivorienne", 446),
                Nationality('Ghanéenne', 4),
                Nationality('Guinéenne', 37),
                Nationality('Libéria', 1),
                Nationality('Malienne', 16),
                Nationality('Mauritanie', 1),
                Nationality('Nigérienne', 5),
                Nationality('Sénégalaise', 3),
                Nationality('Sera Léone', 1),
                Nationality('Togo', 34),
                Nationality('Aucun', 5),
              ],
              enableTooltip: true,
              dataLabelMapper: (Nationality data, _) => data.labelle,
              xValueMapper: (Nationality data, _) => data.labelle,
              yValueMapper: (Nationality data, _) => data.value,
              pointColorMapper: (Nationality data, _) => data.color,
              dataLabelSettings: DataLabelSettings(isVisible: true))
        ],
      ),
    );
  }
}

class Nationality {
  Nationality(this.labelle, this.value, [this.color]);
  final String labelle;
  final double value;
  final Color? color;
}
