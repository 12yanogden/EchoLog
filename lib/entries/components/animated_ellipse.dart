import 'package:flutter/material.dart';
import 'dart:math';
import 'package:echolog/style/custom_colors.dart';

class AnimatedEllipse extends StatelessWidget {
  final AnimationController animationController;
  final int startAngle;
  final bool rotatesClockwise;
  static const double width = 320;
  static const double height = 376;
  static const double thickness = 3.0;

  const AnimatedEllipse(
      {super.key,
      required this.animationController,
      required this.startAngle,
      required this.rotatesClockwise});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: rotatesClockwise
          ? Tween(begin: 0.0, end: 1.0).animate(animationController)
          : Tween(begin: 1.0, end: 0.0).animate(animationController),
      child: Transform.rotate(
          angle: startAngle * pi / 180,
          child: Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(width, height)),
                color: primaryColor),
          )),
    );
  }
}
