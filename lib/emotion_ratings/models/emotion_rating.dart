import 'package:echolog/emotions/models/emotion.dart';

class EmotionRating {
  Emotion emotion;
  int rating;

  EmotionRating(this.emotion, this.rating);

  Emotion getEmotion() {
    return emotion;
  }

  int getRating() {
    return rating;
  }

  void setRating(int rating) {
    this.rating = rating;
  }
}
