import 'package:echolog/emotion_ratings/components/emotion_sliders/emotion_slider.dart';
import 'package:echolog/emotion_ratings/components/emotion_sliders/emotion_sliders.dart';
import 'package:echolog/emotion_ratings/models/emotion_rating.dart';
import 'package:echolog/emotions/models/emotion.dart';
import 'package:echolog/emotions/services/emotion_service.dart';
import 'package:echolog/style/custom_text.dart';
import 'package:flutter/material.dart';

class EmotionRatingForm extends StatefulWidget {
  EmotionRatingForm({super.key});

  @override
  _EmotionRatingFormState createState() => _EmotionRatingFormState();
}

class _EmotionRatingFormState extends State<EmotionRatingForm> {
  List<Emotion> emotions = EmotionService().getActiveEmotions();
  List<EmotionRating> emotionRatings = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _EmotionRatingFormState() {
    initEmotionRatings();
  }

  initEmotionRatings() {
    for (Emotion emotion in emotions) {
      emotionRatings.add(EmotionRating(emotion, 0));
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("How did you feel?", style: xl),
      const SizedBox(
        height: 18,
      ),
      EmotionSliders(emotionRatings: emotionRatings, isEnabled: true)
    ]);
  }
}
