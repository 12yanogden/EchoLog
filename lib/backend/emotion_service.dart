import '../models/emotion.dart';
import 'package:flutter/material.dart';

class EmotionService {
  // Singleton Pattern----------------
  static final EmotionService _instance = EmotionService._internal();

  EmotionService._internal();

  factory EmotionService() {
    return _instance;
  }
  // Singleton Pattern---------------

  List<Emotion> curEmotions = [
    Emotion("😡", Colors.red, "angry", 0),
    Emotion("😭", Colors.blue, "sad", 1),
    Emotion("🥱", Colors.purple, "tired", 2),
    Emotion("😖", Colors.yellow, "stressed", 3),
    Emotion("😄", Colors.green, "happy", 4)
  ];

  List<Emotion> allEmotions = [
    Emotion("😡", Colors.red, "angry", 0),
    Emotion("😭", Colors.blue, "sad", 1),
    Emotion("🥱", Colors.purple, "tired", 2),
    Emotion("😖", Colors.yellow, "stressed", 3),
    Emotion("😄", Colors.green, "happy", 4)
  ];

  List<Emotion> getCurEmotions() {
    return curEmotions;
  }

  addEmotion(Emotion emotion) {
    this.allEmotions.add(emotion);
    this.curEmotions.add(emotion);
  }

  removeCurEmotionByID(int id) {
    Emotion emot = curEmotions.firstWhere((emot) => emot.id == id);
    curEmotions.remove(emot);
  }

  Emotion getEmotionByID(int id) {
    return allEmotions.firstWhere((emot) => emot.id == id);
  }

  int getCurEmotionLimit() {
    return 5;
  }

  int genNextEmotionId() {
    return allEmotions.length + 1;
  }
}
