import 'package:flutter/material.dart';

class Education2Card extends StatelessWidget {
  final String ctext;

  Education2Card({
    required this.ctext
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Center(
        child: Text(ctext, textAlign: TextAlign.center)
      )
    );
  }
}