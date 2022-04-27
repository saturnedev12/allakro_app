import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircularBornChart extends StatelessWidget {
  const CircularBornChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCircularChart(
        title: ChartTitle(
            text: 'Pays de Naissance',
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
                Nationality('Sénégal', 2),
                Nationality('Bénin', 4),
                Nationality('Burkina Fasso', 181),
                Nationality('Comore', 1),
                Nationality("Côte d'ivoire", 530),
                Nationality('Ghana', 4),
                Nationality('Guinée', 35),
                Nationality('Libéria', 1),
                Nationality('Mali', 8),
                Nationality('Mauritanie', 1),
                Nationality('Niger', 4),
                Nationality('Nigéria', 1),
                Nationality('Sera Léone', 1),
                Nationality('Togo', 34),
                Nationality('Aucun', 4),
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
