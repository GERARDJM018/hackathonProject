import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:hackathon2024/education2_flashcard.dart';
import 'education2_card.dart';
import 'education2_flashcard.dart';

void main() {
  runApp(EducationApp());
}

class EducationApp extends StatefulWidget {
  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<EducationApp> {
  List<Education2Flashcard> _flashcards = [
    Education2Flashcard(question: "What is pishing?", answer: "a scam where fraudsters attempt to trick someone into revealing personal / sensitive information."),
    Education2Flashcard(question: "How to recognise a pishing email?", answer: "It often uses urgent language, have errors, and ask for personal info."),
    Education2Flashcard(question: "What is 2FA", answer: "like a password and a code from phone for added security."),
    Education2Flashcard(question: "Why keeping software up to date is important", answer: "Updates fix security vulnerabilities that could be exploitted by hackers."),
    Education2Flashcard(question: "What is considered as strong password", answer: "long, uses a mix of characters, and protexts accounts from unauthorised access."),
  ];

  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('FlashCard Quiz')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                  front: Education2Card(ctext: _flashcards[currIndex].question),
                  back: Education2Card(ctext: _flashcards[currIndex].answer),
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                    onPressed: previousCard,
                    icon: Icon(Icons.chevron_left),
                    label: Text('Prev')
                  ),
                  OutlinedButton.icon(
                    onPressed: nextCard,
                    icon: Icon(Icons.chevron_right),
                    label: Text('Next')
                  ),
                ],
              )
            ]
          )
        )
      )
    );
  }

  void nextCard() {
    setState(() {
      currIndex = (currIndex + 1 < _flashcards.length) ? currIndex + 1 : 0;
    });
  }

  void previousCard() {
    setState(() {
      currIndex = (currIndex - 1 >= 0) ? currIndex - 1 : _flashcards.length - 1;
    });
  }
}
