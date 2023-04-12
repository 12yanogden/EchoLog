import 'package:echolog/emotions/models/emotion.dart';
import 'package:echolog/style/custom_colors.dart';
import 'package:flutter/material.dart';

class EmotionService {
  // Singleton Pattern
  static final EmotionService _instance = EmotionService._internal();

  EmotionService._internal();

  factory EmotionService() {
    return _instance;
  }

  List<Emotion> emotions = [
    Emotion(0, "😉", a2, "Positive", true),
    Emotion(1, "😅", b2, "Slightly Embarrassed", true),
    Emotion(2, "😖", c2, "Super Embarrassed", true),
    Emotion(3, "😒", d2, "Put off", true),
    Emotion(4, "💀", e2, "Checked out", true)
  ];

  List<Emotion> getActiveEmotions() {
    List<Emotion> activeEmotions = [];

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
