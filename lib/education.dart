import 'package:flutter/material.dart';
import 'education_card.dart';

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
              EducationCard(
                title: 'Signs of Scam Material',
                content: 'Be cautious of unfamiliar URLs, grammatical errors, or pressure tactics to make you act hastily.'
              ),
              SizedBox(height: 20),
              EducationCard(
                title: 'Common Types of Scam',
                content: 'Deceptive emails or websites, phone scam, pop-up message, in-person scam',
              ),
              SizedBox(height: 20),
              EducationCard(
                title: 'What is Pishing',
                content: 'A type of cybercrime where fraudsters tries to deceive people to reveal sensitive information.',
              ),
              SizedBox(height: 20),
              EducationCard(
                title: 'How to Protect Yourself',
                content: 'Verify requests, avoid sharing sensitive information, and making payments to unknown sources',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
