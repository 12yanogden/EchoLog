import 'package:echolog/emotion_ratings/components/emotion_sliders/slider_thumb.dart';
import 'package:echolog/emotion_ratings/components/emotion_sliders/slider_track.dart';
import 'package:echolog/emotions/models/emotion.dart';
import 'package:echolog/style/custom_colors.dart';
import 'package:flutter/material.dart';

class EmotionSlider extends StatefulWidget {
  final Emotion emotion;
  final bool isEnabled;
  Function setEmotionRating;

  EmotionSlider(
      {super.key,
      required this.emotion,
      required this.isEnabled,
      required this.setEmotionRating});

  @override
  _EmotionSliderState createState() => _EmotionSliderState();
}

class _EmotionSliderState extends State<EmotionSlider> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      margin: const EdgeInsets.all(2.0),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)), color: offWhite),
      child: SliderTheme(
        data: SliderThemeData(
            thumbShape: SliderThumb(widget.emotion.getEmoji()),
            trackShape: SliderTrack(widget.emotion.getColor()),
            tickMarkShape: SliderTickMarkShape.noTickMark),
        child: Slider(
            value: 0,
            max: 5,
            divisions: 5,
            label: widget.emotion.getName(),
            onChanged: (double value) {
              if (widget.isEnabled) {
                setState(() {
                  widget.setEmotionRating(widget.emotion.id, value);
                });
              }
            }),
      ),
    );
  }
}
