import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorSquare extends StatelessWidget {
  final Color color;

  // Pass in a Color object (eg. Color(0xFF0000FF))
  ColorSquare({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 32,
        width: 32,
        color: Colors.transparent,
        child: Container(
            decoration: BoxDecoration(
                color: this.color,
                borderRadius: BorderRadius.all(Radius.circular(6.0))))
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(6), color: this.color)
        );
  }
}
