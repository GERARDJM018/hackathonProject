import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieScreen extends StatefulWidget {
  const PieScreen({ Key? key }) : super(key: key);

  @override
  _PieScreenState createState() => _PieScreenState();
}

class _PieScreenState extends State<PieScreen> {
  final List<PieData> pieData = [
    PieData('scam1', 20),
    PieData('scam2', 35),
    PieData('scam3', 5),
    PieData('scam4', 22),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pie Chart'),
      ),
      body: Center(
        child: Container(
          child: SfCircularChart(
            title: ChartTitle(text: 'Scam Data in a Week'),
            legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap, position: LegendPosition.bottom),
            series: <CircularSeries>[
              DoughnutSeries<PieData, String> (
                dataSource: pieData,
                xValueMapper: (PieData dt, _) => dt.name,
                yValueMapper: (PieData dt, _) => dt.data,
                dataLabelSettings: DataLabelSettings(isVisible: true),
              )
            ]
          )
        )
      ),
    );
  }
}

class PieData {
  PieData(this.name, this.data);
  final String name;
  final int data;
}
