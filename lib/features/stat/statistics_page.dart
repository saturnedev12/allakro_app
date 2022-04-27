import 'package:allakroapp/features/stat/widgets/circular_born_chart.dart';
import 'package:allakroapp/features/stat/widgets/circular_gender_chart.dart';
import 'package:allakroapp/features/stat/widgets/level_school.dart';
import 'package:allakroapp/features/stat/widgets/matrimonial_chart.dart';
import 'package:allakroapp/features/stat/widgets/mobile_network_chart.dart';
import 'package:allakroapp/features/stat/widgets/natioannality_chart.dart';
import 'package:allakroapp/features/stat/widgets/reading_chart.dart';
import 'package:allakroapp/features/stat/widgets/tranche_age_chart.dart';
import 'package:allakroapp/features/stat/widgets/using_network.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('statistiques du village'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /*Container(
              height: 300,
              child: SfCartesianChart(
                  // Initialize category axis
                  primaryXAxis: CategoryAxis(),
                  series: <LineSeries<SalesData, String>>[
                    LineSeries<SalesData, String>(
                        // Bind data source
                        dataSource: <SalesData>[
                          SalesData('Jan', 35),
                          SalesData('Feb', 28),
                          SalesData('Mar', 34),
                          SalesData('Apr', 32),
                          SalesData('May', 40)
                        ],
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales)
                  ]),
            ),
          */

            CircularGenderChart(),
            CircularBornChart(),
            NationnalityChart(),
            MatrimonialeChart(),
            MobileNetWortChart(),
            UsingNetWortChart(),
            ReadingChart(),
            LevelSchoolChart(),
            TrancheAgeChart(),
          ],
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
