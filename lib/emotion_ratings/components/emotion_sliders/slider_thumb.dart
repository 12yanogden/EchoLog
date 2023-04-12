import 'package:echolog/style/custom_colors.dart';
import 'package:flutter/material.dart';

class SliderThumb extends SliderComponentShape {
  final String emoji;
  final double thumbRadius = 16;
  late final TextPainter textPainter;

  SliderThumb(this.emoji) {
    textPainter = TextPainter(
        text: TextSpan(
          style: TextStyle(
            fontSize: thumbRadius * 1.3,
            fontWeight: FontWeight.w700,
            color: Colors.black, //Text Color of Value on Thumb
          ),
          text: emoji,
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);

    textPainter.layout();
  }

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = offWhite //Thumb Background Color
      ..style = PaintingStyle.fill;

    Offset textCenter = Offset(center.dx - (textPainter.width / 2),
        center.dy - (textPainter.height / 2));

    canvas.drawCircle(center, thumbRadius, paint);
    textPainter.paint(canvas, textCenter);
  }
}
