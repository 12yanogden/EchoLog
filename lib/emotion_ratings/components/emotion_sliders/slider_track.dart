import 'package:echolog/style/custom_colors.dart';
import 'package:flutter/material.dart';

class SliderTrack extends SliderTrackShape {
  late final Color activeTrackColor;

  SliderTrack(this.activeTrackColor);

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
      required TextDirection textDirection,
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
      ..color = activeTrackColor.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final Paint tickMarkPaint = Paint()
      ..color = offWhite
      ..style = PaintingStyle.fill;

    Paint leftTrackPaint = activePaint;
    Paint rightTrackPaint = inactivePaint;

    // For LTR/RTL support.
    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case TextDirection.rtl:
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

    const double tickMarkWidth = 2.0;
    final double totalLength = trackRect.right - trackRect.left;

    final activePathSegment = Path()
      ..moveTo(trackRect.left, trackRect.bottom)
      ..lineTo(trackRect.left, trackRect.top)
      ..lineTo(thumbCenter.dx, trackRect.top - (yPoint / 2))
      ..lineTo(thumbCenter.dx, trackRect.bottom + (yPoint / 2))
      ..close();

    final inactivePathSegment = Path()
      ..moveTo(thumbCenter.dx, trackRect.bottom + (yPoint / 2))
      ..lineTo(thumbCenter.dx, trackRect.top - (yPoint / 2))
      ..lineTo(trackRect.right, trackRect.top - (trackHeightVariation / 2))
      ..lineTo(trackRect.right, trackRect.bottom + (trackHeightVariation / 2))
      ..close();

    List<Path> tickMarks = [];

    for (int i = 0; i < 6; i++) {
      double tickOffset = i * totalLength / 5;
      tickMarks.add(Path()
        ..moveTo(trackRect.left + tickOffset,
            trackRect.bottom + (trackHeightVariation / 2))
        ..lineTo(trackRect.left + tickMarkWidth + tickOffset,
            trackRect.bottom + (trackHeightVariation / 2))
        ..lineTo(trackRect.left + tickMarkWidth + tickOffset,
            trackRect.top - (trackHeightVariation / 2))
        ..lineTo(trackRect.left + tickOffset,
            trackRect.top - (trackHeightVariation / 2))
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
