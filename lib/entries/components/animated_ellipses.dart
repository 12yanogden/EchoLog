import 'package:echolog/style/custom_colors.dart';
import 'package:flutter/material.dart';

import 'animated_ellipse.dart';

class AnimatedEllipses extends StatefulWidget {
  final bool isAnimating;

  const AnimatedEllipses({super.key, required this.isAnimating});

  @override
  AnimatedEllipsesState createState() => AnimatedEllipsesState();
}

class AnimatedEllipsesState extends State<AnimatedEllipses>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  final bool isAlternating = true;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    );
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isAnimating) {
      animationController.repeat();
    } else {
      animationController.stop();
    }
    return Stack(alignment: Alignment.center, children: [
      AnimatedEllipse(
          animationController: animationController,
          startAngle: 0,
          rotatesClockwise: true),
      AnimatedEllipse(
          animationController: animationController,
          startAngle: 60,
          rotatesClockwise: !isAlternating),
      AnimatedEllipse(
          animationController: animationController,
          startAngle: 120,
          rotatesClockwise: true),
      AnimatedEllipse(
          animationController: animationController,
          startAngle: 180,
          rotatesClockwise: !isAlternating),
      AnimatedEllipse(
          animationController: animationController,
          startAngle: 240,
          rotatesClockwise: !isAlternating),
      AnimatedEllipse(
          animationController: animationController,
          startAngle: 300,
          rotatesClockwise: true),
      AnimatedEllipse(
          animationController: animationController,
          startAngle: 180,
          rotatesClockwise: !isAlternating),
      AnimatedEllipse(
          animationController: animationController,
          startAngle: 210,
          rotatesClockwise: true),
      AnimatedEllipse(
          animationController: animationController,
          startAngle: 240,
          rotatesClockwise: !isAlternating),
      AnimatedEllipse(
          animationController: animationController,
          startAngle: 270,
          rotatesClockwise: true),
      AnimatedEllipse(
          animationController: animationController,
          startAngle: 300,
          rotatesClockwise: !isAlternating),
      AnimatedEllipse(
          animationController: animationController,
          startAngle: 330,
          rotatesClockwise: true),
      Container(
          width: 320,
          height: 320,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(320, 320)),
              color: offWhite))
    ]);
  }
}
