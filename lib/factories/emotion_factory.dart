import 'package:echolog/emotions/models/emotion.dart';
import 'package:echolog/style/custom_colors.dart';

class EmotionFactory {
  List<Emotion> makeEmotions() {
    return [
      Emotion(0, "😉", a2, "Positive", true),
      Emotion(1, "😅", b2, "Slightly Embarrassed", true),
      Emotion(2, "😖", c2, "Super Embarrassed", true),
      Emotion(3, "😒", d2, "Put off", true),
      Emotion(4, "💀", e2, "Checked out", true)
    ];
  }
}
