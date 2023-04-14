import 'package:echolog/emotion_ratings/components/emotion_sliders/emotion_slider.dart';
import 'package:echolog/emotion_ratings/models/emotion_rating.dart';
import 'package:echolog/emotions/models/emotion.dart';
import 'package:flutter/material.dart';

class EmotionSliders extends StatefulWidget {
  final List<EmotionRating> emotionRatings;
  bool isEnabled;

  EmotionSliders(
      {super.key, required this.emotionRatings, required this.isEnabled});

  @override
  _EmotionSlidersState createState() => _EmotionSlidersState();
}

class _EmotionSlidersState extends State<EmotionSliders> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  setEmotionRating(Emotion emotion, int rating) {
    for (int i = 0; i < widget.emotionRatings.length; i++) {
      if (widget.emotionRatings[i].getEmotion() == emotion) {
        widget.emotionRatings[i].setRating(rating);
      }
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ListView.separated(
          shrinkWrap: true,
          itemCount: widget.emotionRatings.length,
          itemBuilder: (BuildContext context, int index) {
            return EmotionSlider(
                emotion: widget.emotionRatings[index].getEmotion(),
                isEnabled: widget.isEnabled,
                setEmotionRating: setEmotionRating);
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ));
    });
  }
}
