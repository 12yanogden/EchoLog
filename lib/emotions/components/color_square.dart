import 'package:flutter/material.dart';

class ColorSquare extends StatelessWidget {
  final Color color;

  const ColorSquare({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 32,
        width: 32,
        color: Colors.transparent,
        child: Container(
            decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(6.0)))));
  }
}
