import 'package:echolog/components/checkmark_button.dart';
import 'package:echolog/components/modal_top_bar.dart';
import 'package:echolog/emotion_ratings/components/emotion_sliders/emotion_sliders.dart';
import 'package:echolog/emotion_ratings/models/emotion_rating.dart';
import 'package:echolog/emotions/models/emotion.dart';
import 'package:echolog/emotions/services/emotion_service.dart';
import 'package:echolog/style/custom_text.dart';
import 'package:flutter/material.dart';

class EmotionRatingForm extends StatefulWidget {
  final Function back;
  final Function(List<EmotionRating>) setEmotionRatings;

  const EmotionRatingForm(
      {super.key, required this.back, required this.setEmotionRatings});

  @override
  EmotionRatingFormState createState() => EmotionRatingFormState();
}

class EmotionRatingFormState extends State<EmotionRatingForm> {
  List<Emotion> emotions = EmotionService().getActiveEmotions();
  List<EmotionRating> emotionRatings = [];

  @override
  void initState() {
    super.initState();

    initEmotionRatings();
  }

  @override
  void dispose() {
    super.dispose();
  }

  initEmotionRatings() {
    for (Emotion emotion in emotions) {
      emotionRatings.add(EmotionRating(emotion, 0));
    }
  }

  setEmotionRating(EmotionRating emotionRating) {
    for (int i = 0; i < emotionRatings.length; i++) {
      if (emotionRatings[i].getEmotion() == emotionRating.getEmotion()) {
        setState(() {
          emotionRatings[i].setRating(emotionRating.getRating());
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          ModalTopBar(back: widget.back),
          Text("How did you feel?", style: xl),
          const SizedBox(
            height: 32,
          ),
          EmotionSliders(
              emotionRatings: emotionRatings,
              setEmotionRating: setEmotionRating),
          const SizedBox(
            height: 32,
          ),
          InkWell(
              onTap: () => widget.setEmotionRatings(emotionRatings),
              child: const CheckmarkButton())
        ]));
  }
}
