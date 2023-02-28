import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import './theme_colors.dart';
import '../backend/emotion_service.dart';
import '../models/emotion.dart';

class EmotSliders extends StatefulWidget {
  late final List<double> emotionValues;
  late final List<String> emojis = [];
  late final List<String> emojiNames = [];
  late final List<Color> emojiColors = [];
  late final List<Emotion> emotions;
  final bool isEnabled; // can the sliders move

  EmotSliders(
      {Key? key,
      required this.emotionValues,
      required this.emotions,
      this.isEnabled = true})
      : super(key: key) {
        this.emotions.forEach((emot) {
          this.emojis.add(emot.emoji);
          this.emojiNames.add(emot.name);
          this.emojiColors.add(emot.color);
        });
      }

  @override
  _EmotSliderState createState() => _EmotSliderState(
      emotionValues, emojis, emojiNames, emojiColors, isEnabled);

  List<double> getEmotValuesCopy() {
    List<double> copy = [];
    for(double value in emotionValues) {
      copy.add(value);
    }

    return copy;
  }
}

class _EmotSliderState extends State<EmotSliders> {
  double thumbRadious = 20.0;
  List<double> emotionValues;
  List<String> emojis;
  List<String> emojiNames;
  List<Color> emojiColors;
  bool isEnabled;

  _EmotSliderState(this.emotionValues, this.emojis, this.emojiNames,
      this.emojiColors, this.isEnabled);

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < emojis.length; i++)
          _EmotSlider(i, emojis[i], emojiNames[i], emojiColors[i])
      ],
    );
  }

  Container _EmotSlider(
      int num, String emoji, String emotName, Color emotColor) {

    Color bgColor = ThemeColors.primaryBg;

    return Container(
      padding: EdgeInsets.all(3.0),
      margin: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: bgColor
      ),
      child: SliderTheme(
        data: SliderThemeData(
            thumbShape: _SliderThumbEmot(thumbRadious, emoji, bgColor),
            trackShape: TriangleTrackShape(emotColor, bgColor),
            tickMarkShape: SliderTickMarkShape.noTickMark
            ),
        child: Slider(
            value: this.emotionValues[num],
            max: 5,
            divisions: 5,
            label: emotName,
            onChanged: (double value) {
              if (isEnabled) {
                setState(() {
                  this.emotionValues[num] = value;
                });
              }
            }),
      ),
    );
  }
}

class _SliderThumbEmot extends SliderComponentShape {
  final double thumbRadius;
  final String emoji;
  final Color bgColor; //Color.fromRGBO(0, 0, 0, 0); // clear

  late final TextPainter tp;

  _SliderThumbEmot(this.thumbRadius, this.emoji, this.bgColor) {
    TextSpan span = new TextSpan(
      style: new TextStyle(
        fontSize: thumbRadius * 1.3,
        fontWeight: FontWeight.w700,
        color: Colors.black, //Text Color of Value on Thumb
      ),
      text: this.emoji,
    );

    this.tp = new TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: ui.TextDirection.ltr);

    tp.layout();
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
    required ui.TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = bgColor //Thumb Background Color
      ..style = PaintingStyle.fill;

    Offset textCenter =
        Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawCircle(center, thumbRadius, paint);
    tp.paint(canvas, textCenter);
  }
}

class TriangleTrackShape extends SliderTrackShape {
  late final activeTrackColor;
  late final bgColor;

  TriangleTrackShape(this.activeTrackColor, this.bgColor);

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    SliderThemeData? sliderTheme,
    bool? isEnabled,
    bool? isDiscrete,
  }) {
    final double thumbWidth =
        sliderTheme!.thumbShape!.getPreferredSize(true, isDiscrete!).width;
    const double trackHeight = 2.0;
    assert(thumbWidth >= 0);
    assert(trackHeight >= 0);
    assert(parentBox.size.width >= thumbWidth);
    assert(parentBox.size.height >= trackHeight);

    final double trackLeft = offset.dx + thumbWidth / 2;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width - thumbWidth;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }


  @override
  void paint(PaintingContext context, Offset offset,
      {required Animation<double> enableAnimation,
      bool? isDiscrete,
      bool? isEnabled,
      required RenderBox parentBox,
      Offset? secondaryOffset,
      required SliderThemeData sliderTheme,
      required ui.TextDirection textDirection,
      required Offset thumbCenter}) {
    if (sliderTheme.trackHeight == 0) {
      return;
    }

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );
    // Paint color for active and inactive segments of the track. We can also define the colors to be gradient here.
    final Paint activePaint = Paint()
      ..color = activeTrackColor
      ..style = PaintingStyle.fill;
    final Paint inactivePaint = Paint()
      ..color = ThemeColors.secondaryBg
      ..style = PaintingStyle.fill;

    final Paint tickMarkPaint = Paint()
      ..color = bgColor
      ..style = PaintingStyle.fill;

    Paint leftTrackPaint = activePaint;
    Paint rightTrackPaint = inactivePaint;

    // For LTR/RTL support.
    switch (textDirection) {
      case ui.TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case ui.TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
      default:
        break; // won't happen
    }

    // Since the triangle resembles the right triangle find the y co-ordinate (height with respect to the selection value, so the path of active and inactive segements can be drawn)
    const double trackHeightVariation = 30;
    const double trackShiftAlongY =
        0; // Shift the track so that the thumb will be placed in the center. // I removed this (it was added to every y value in the Path definitions)
    final double trackDistance = (trackRect.right - trackRect.left).abs();
    final double customTrackHeight =
        (trackRect.bottom - (trackRect.top - trackHeightVariation));
    final valuePercent = ((thumbCenter.dx - trackRect.left) / 1).abs();
    final yPoint = ((customTrackHeight / trackDistance) * valuePercent);

    final double tickMarkWidth = 2.0;
    final double totalLength = trackRect.right - trackRect.left;

    final activePathSegment = Path()
      ..moveTo(trackRect.left, trackRect.bottom)
      ..lineTo(trackRect.left, trackRect.top)
      ..lineTo(thumbCenter.dx, trackRect.top - (yPoint/2))
      ..lineTo(thumbCenter.dx, trackRect.bottom + (yPoint/2))
      ..close();

    final inactivePathSegment = Path()
      ..moveTo(thumbCenter.dx, trackRect.bottom + (yPoint/2))
      ..lineTo(thumbCenter.dx, trackRect.top - (yPoint/2))
      ..lineTo(trackRect.right, trackRect.top - (trackHeightVariation/2))
      ..lineTo(trackRect.right, trackRect.bottom + (trackHeightVariation/2))
      ..close();

    List<Path> tickMarks = []; 
    
    for (int i = 0; i < 6; i++) {
      double tickOffset = i*totalLength/5;
      tickMarks.add(Path()
      ..moveTo(trackRect.left + tickOffset, trackRect.bottom + (trackHeightVariation/2))
      ..lineTo(trackRect.left + tickMarkWidth + tickOffset, trackRect.bottom + (trackHeightVariation/2))
      ..lineTo(trackRect.left + tickMarkWidth + tickOffset, trackRect.top - (trackHeightVariation/2))
      ..lineTo(trackRect.left + tickOffset, trackRect.top - (trackHeightVariation/2))
      ..close());
    }


    context.canvas.drawPath(activePathSegment, leftTrackPaint);
    context.canvas.drawPath(inactivePathSegment, rightTrackPaint);
    for (int i = 0; i < 6; i++) {
      context.canvas.drawPath(tickMarks[i], tickMarkPaint);
    }
    // If we want shadows to the track or active portion we can define that and draw that.
  }
}
