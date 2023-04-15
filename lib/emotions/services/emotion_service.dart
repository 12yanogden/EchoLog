import 'package:echolog/emotions/models/emotion.dart';
import 'package:echolog/factories/emotion_factory.dart';

class EmotionService {
  // Singleton Pattern
  static final EmotionService _instance = EmotionService._internal();
  final EmotionFactory emotionFactory = EmotionFactory();
  List<Emotion> emotions = [];

  EmotionService._internal();

  factory EmotionService() {
    return _instance;
  }

  void lazyLoadEmotions() {
    if (emotions.isEmpty) emotions = emotionFactory.makeEmotions();
  }

  List<Emotion> getActiveEmotions() {
    List<Emotion> activeEmotions = [];

    lazyLoadEmotions();

    for (Emotion emotion in emotions) {
      if (emotion.isActivated()) {
        activeEmotions.add(emotion);
      }
    }

    return activeEmotions;
  }

  addEmotion(Emotion emotion) {
    emotions.add(emotion);
  }

  deactivateEmotionByID(int id) {
    getEmotionByID(id).setIsActive(false);
  }

  Emotion getEmotionByID(int id) {
    return emotions.firstWhere((emot) => emot.id == id);
  }

  int getActiveEmotionLimit() {
    return 5;
  }

  int calcNextEmotionId() {
    return emotions.length + 1;
  }

  int getActiveEmotionCount() {
    return getActiveEmotions().length;
  }
}
