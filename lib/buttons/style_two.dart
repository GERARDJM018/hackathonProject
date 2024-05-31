import 'package:flutter/material.dart';

class StyleTwo extends StatelessWidget {
  final Icon icon;
  final Function func;
  const StyleTwo({
    required this.icon,
    required this.func,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)), padding: EdgeInsets.symmetric(horizontal: 0.00001)),
      onPressed: () {},
      child: icon,);
  }
}