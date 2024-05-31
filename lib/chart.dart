import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({ Key? key }) : super(key: key);

  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  final List<ChartData> chartData = [
    ChartData('1', 20, 30, 40, 50),
    ChartData('2', 40, 20, 10, 20),
    ChartData('3', 20, 20, 24, 15),
    ChartData('4', 10, 14, 22, 35),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar Chart'),
      ),
      body: Center(
        child: Container(
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(title: AxisTitle(text:'Week')), 
            legend: Legend(isVisible: true, position: LegendPosition.bottom),
            series: <CartesianSeries>[
              StackedColumnSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ch, _) => ch.x,
                yValueMapper: (ch, _) => ch.y1,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                name: 'Scam 1'
              ),
              StackedColumnSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ch, _) => ch.x,
                yValueMapper: (ch, _) => ch.y2,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                name: 'Scam 2'
              ),
              StackedColumnSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ch, _) => ch.x,
                yValueMapper: (ch, _) => ch.y3,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                name: 'Scam 3'
              ),
              StackedColumnSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ch, _) => ch.x,
                yValueMapper: (ch, _) => ch.y4,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                name: 'Scam 3'
              )
            ])
        )
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y1, this.y2, this.y3, this.y4);
  final String x;
  final int y1;
  final int y2;
  final int y3;
  final int y4;
}
