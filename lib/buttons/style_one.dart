import 'package:flutter/material.dart';

class StyleOne extends StatelessWidget {
  final Icon icon;
  final String counter;
  final Function func;
  const StyleOne({
    required this.icon,
    required this.counter,
    required this.func,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton.icon(
      onPressed: () {}, 
      label: Text(counter),
      icon: icon,);
  }
}