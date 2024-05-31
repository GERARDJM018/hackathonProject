import 'package:flutter/material.dart';
import 'report_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Card Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Education Page')
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // ReportCard(
              //   title: 'Signs of Scam Material',
              //   body: 'Be cautious of unfamiliar URLs, grammatical errors, or pressure tactics to make you act hastily.'
              // ),
              SizedBox(height: 20),
              // ReportCard(
              //   title: 'Common Types of Scam',
              //   body: 'Deceptive emails or websites, phone scam, pop-up message, in-person scam',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}