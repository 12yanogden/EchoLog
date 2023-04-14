import 'package:echolog/emotion_ratings/components/emotion_sliders/emotion_slider.dart';
import 'package:echolog/emotion_ratings/models/emotion_rating.dart';
import 'package:flutter/material.dart';

class EmotionSliders extends StatefulWidget {
  final List<EmotionRating> emotionRatings;
  final Function(EmotionRating)? setEmotionRating;

  const EmotionSliders(
      {super.key,
      required this.emotionRatings,
      required this.setEmotionRating});

  @override
  EmotionSlidersState createState() => EmotionSlidersState();
}

class EmotionSlidersState extends State<EmotionSliders> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ListView.separated(
          shrinkWrap: true,
          itemCount: widget.emotionRatings.length,
          itemBuilder: (BuildContext context, int index) {
            return EmotionSlider(
                emotionRating: widget.emotionRatings[index],
                setEmotionRating: widget.setEmotionRating);
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ));
    });
  }
}
