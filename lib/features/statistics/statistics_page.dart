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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
            Container(
              child: SfCircularChart(
                title: ChartTitle(
                    text: 'Half yearly sales analysis',
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
                  PieSeries<ChartData, String>(
                      dataSource: [
                        ChartData('David', 25),
                        ChartData('Steve', 38),
                        ChartData('Jack', 34),
                        ChartData('Others', 52)
                      ],
                      enableTooltip: true,
                      dataLabelMapper: (ChartData data, _) => data.x,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ],
              ),
            ),
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
