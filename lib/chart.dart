import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon2024/auth/auth.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({ Key? key }) : super(key: key);

  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {

  final List<String> categoryItems = ['SMS Phising', 'Email Phising', 'Credit Card Scams', 'Payment Fraud', 'Prize Draw Scams', 'Others'];

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  late User? user = Auth(_firebaseAuth).currentUser;

  @override
  void initState() {
    // TODO: implement initState
    _loadDatabase();
    super.initState();
  }

  _loadDatabase() async {

    DateTime now = DateTime.now();
    DateTime oneMonthAgo = now.subtract(Duration(days: 28));
    DateTime threeWeeksAgo = now.subtract(Duration(days: 21));
    DateTime twoWeeksAgo = now.subtract(Duration(days: 14));
    DateTime oneWeekAgo = now.subtract(Duration(days: 7));

    final snapSMS4 = await FirebaseFirestore.instance
        .collection('reports')
        .where('category', isEqualTo: categoryItems[0])
        .where('date', isGreaterThan: oneWeekAgo)
        .get();
    
    final snapSMS3 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: twoWeeksAgo, isLessThan: oneWeekAgo)
        .where('category', isEqualTo: categoryItems[0])
        .get();

    final snapSMS2 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: threeWeeksAgo, isLessThan: twoWeeksAgo)
        .where('category', isEqualTo: categoryItems[0])
        .get();

    final snapSMS1 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: oneMonthAgo, isLessThan: threeWeeksAgo)
        .where('category', isEqualTo: categoryItems[0])
        .get();

    final snapCredit4 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: oneWeekAgo)
        .where('category', isEqualTo: categoryItems[2])
        .get();    

    final snapCredit3 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: twoWeeksAgo, isLessThan: oneWeekAgo)
        .where('category', isEqualTo: categoryItems[2])
        .get();

    final snapCredit2 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: threeWeeksAgo, isLessThan: twoWeeksAgo)
        .where('category', isEqualTo: categoryItems[2])
        .get();

    final snapCredit1 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: oneMonthAgo, isLessThan: threeWeeksAgo)
        .where('category', isEqualTo: categoryItems[2])
        .get();

    final snapPayment4 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: oneWeekAgo)
        .where('category', isEqualTo: categoryItems[3])
        .get();    

    final snapPayment3 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: twoWeeksAgo, isLessThan: oneWeekAgo)
        .where('category', isEqualTo: categoryItems[3])
        .get();

    final snapPayment2 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: threeWeeksAgo, isLessThan: twoWeeksAgo)
        .where('category', isEqualTo: categoryItems[3])
        .get();

    final snapPayment1 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: oneMonthAgo, isLessThan: threeWeeksAgo)
        .where('category', isEqualTo: categoryItems[3])
        .get();       

    final snapPrize4 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: oneWeekAgo)
        .where('category', isEqualTo: categoryItems[4])
        .get();    

    final snapPrize3 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: twoWeeksAgo, isLessThan: oneWeekAgo)
        .where('category', isEqualTo: categoryItems[4])
        .get();

    final snapPrize2 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: threeWeeksAgo, isLessThan: twoWeeksAgo)
        .where('category', isEqualTo: categoryItems[4])
        .get();

    final snapPrize1 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: oneMonthAgo, isLessThan: threeWeeksAgo)
        .where('category', isEqualTo: categoryItems[4])
        .get();   

    final snapOther4 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: oneWeekAgo)
        .where('category', isEqualTo: categoryItems[5])
        .get();    

    final snapOther3 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: twoWeeksAgo, isLessThan: oneWeekAgo)
        .where('category', isEqualTo: categoryItems[5])
        .get();

    final snapOther2 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: threeWeeksAgo, isLessThan: twoWeeksAgo)
        .where('category', isEqualTo: categoryItems[5])
        .get();

    final snapOther1 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: oneMonthAgo, isLessThan: threeWeeksAgo)
        .where('category', isEqualTo: categoryItems[5])
        .get();   

    final snapEmail4 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: oneWeekAgo)
        .where('category', isEqualTo: categoryItems[1])
        .get();    

    final snapEmail3 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: twoWeeksAgo, isLessThan: oneWeekAgo)
        .where('category', isEqualTo: categoryItems[1])
        .get();

    final snapEmail2 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: threeWeeksAgo, isLessThan: twoWeeksAgo)
        .where('category', isEqualTo: categoryItems[1])
        .get();

    final snapEmail1 = await FirebaseFirestore.instance
        .collection('reports')
        .where('date', isGreaterThan: oneMonthAgo, isLessThan: threeWeeksAgo)
        .where('category', isEqualTo: categoryItems[1])
        .get();   


    setState(() {
      chartData = [
        ChartData('1', snapEmail1.docs.length, snapPayment1.docs.length, snapPrize1.docs.length, snapCredit1.docs.length, snapSMS1.docs.length, snapOther1.docs.length),
        ChartData('2', snapEmail2.docs.length, snapPayment2.docs.length, snapPrize2.docs.length, snapCredit2.docs.length, snapSMS2.docs.length, snapOther2.docs.length),
        ChartData('3', snapEmail3.docs.length, snapPayment3.docs.length, snapPrize3.docs.length, snapCredit3.docs.length, snapSMS3.docs.length, snapOther3.docs.length),
        ChartData('4', snapEmail4.docs.length, snapPayment4.docs.length, snapPrize4.docs.length, snapCredit4.docs.length, snapSMS4.docs.length, snapOther4.docs.length),
    ];
    });
  }

  List<ChartData> chartData = [
    ChartData('1', 20, 30, 40, 50, 2, 3),
    ChartData('2', 40, 20, 10, 20, 3, 4,),
    ChartData('3', 20, 20, 24, 15, 3, 4),
    ChartData('4', 10, 14, 22, 35, 4, 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar Chart'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(title: AxisTitle(text:'Week')), 
<<<<<<< HEAD
            legend: Legend(isVisible: true, position: LegendPosition.bottom, shouldAlwaysShowScrollbar: true),
=======
            legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap, position: LegendPosition.bottom),
>>>>>>> a6de1ebcccbc37958db8cb4bb0c05f43fb13f907
            series: <CartesianSeries>[
              StackedColumnSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ch, _) => ch.x,
                yValueMapper: (ch, _) => ch.y1,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                name: categoryItems[1]
              ),
              StackedColumnSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ch, _) => ch.x,
                yValueMapper: (ch, _) => ch.y2,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                name: categoryItems[3]
              ),
              StackedColumnSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ch, _) => ch.x,
                yValueMapper: (ch, _) => ch.y3,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                name: categoryItems[4]
              ),
              StackedColumnSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ch, _) => ch.x,
                yValueMapper: (ch, _) => ch.y4,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                name: categoryItems[2]
              ),
              StackedColumnSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ch, _) => ch.x,
                yValueMapper: (ch, _) => ch.y5,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                name: categoryItems[0]
              ),
              StackedColumnSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ch, _) => ch.x,
                yValueMapper: (ch, _) => ch.y6,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                name: categoryItems[5]
              ),
            ])
        )
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y1, this.y2, this.y3, this.y4, this.y5, this.y6);
  final String x;
  final int y1;
  final int y2;
  final int y3;
  final int y4;
  final int y5;
  final int y6;
}
