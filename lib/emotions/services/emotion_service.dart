import 'package:echolog/emotions/models/emotion.dart';
import 'package:flutter/material.dart';

class EmotionService {
  // Singleton Pattern
  static final EmotionService _instance = EmotionService._internal();

  EmotionService._internal();

  factory EmotionService() {
    _instance.initializeActiveEmotions();

    return _instance;
  }

  List<Emotion> emotions = [
    Emotion(0, "😡", Colors.red, "angry", true),
    Emotion(1, "😭", Colors.blue, "sad", true),
    Emotion(2, "🥱", Colors.purple, "tired", true),
    Emotion(3, "😖", Colors.yellow, "stressed", true),
    Emotion(4, "😄", Colors.green, "happy", true)
  ];
  List<Emotion> activeEmotions = [];

  void initializeActiveEmotions() {
    List<Emotion> activeEmotions = [];

    for (Emotion emotion in emotions) {
      if (emotion.isActivated()) {
        activeEmotions.add(emotion);
      }
    }

    this.activeEmotions = activeEmotions;
  }

  List<Emotion> getActiveEmotions() {
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
