import 'package:echolog/emotion_ratings/components/emotion_sliders/slider_thumb.dart';
import 'package:echolog/emotion_ratings/components/emotion_sliders/slider_track.dart';
import 'package:echolog/emotion_ratings/models/emotion_rating.dart';
import 'package:echolog/emotions/models/emotion.dart';
import 'package:echolog/style/custom_colors.dart';
import 'package:flutter/material.dart';

class EmotionSlider extends StatefulWidget {
  final EmotionRating emotionRating;
  final Function(EmotionRating)? setEmotionRating;

  const EmotionSlider(
      {super.key, required this.emotionRating, this.setEmotionRating});

  @override
  EmotionSliderState createState() => EmotionSliderState();
}

class EmotionSliderState extends State<EmotionSlider> {
  late final Emotion emotion;

  @override
  void initState() {
    super.initState();

    emotion = widget.emotionRating.getEmotion();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      margin: const EdgeInsets.all(2.0),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)), color: offWhite),
      child: SliderTheme(
        data: SliderThemeData(
            thumbShape: SliderThumb(emotion.getEmoji()),
            trackShape: SliderTrack(emotion.getColor()),
            tickMarkShape: SliderTickMarkShape.noTickMark),
        child: Slider(
            value: 0,
            max: 5,
            divisions: 5,
            label: emotion.getName(),
            onChanged: (double value) {
              if (widget.setEmotionRating != null) {
                widget.emotionRating.setRating(value.toInt());

                setState(() {
                  widget.setEmotionRating!(widget.emotionRating);
                });
              }
            }),
      ),
    );
  }
}
