import 'package:flutter/material.dart';

void main() {
  runApp(TopBar());
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: IconButton(
            icon: Image.asset('assets/BlocScam.jpg', width: 100, height: 100),
            onPressed: () {

            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                
              }
            ),

            IconButton(
              icon: Image.asset('assets/person.jpg', width: 25, height: 25),
              onPressed: () {

              }
              )
          ]
        ),
      ),
    );
  }
}