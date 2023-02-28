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


  List<Emotion> cur_emotions = [
    Emotion("😡", "angary", Colors.red, 0),
    Emotion("😭", "sad", Colors.blue, 1),
    Emotion("🥱", "tired", Colors.purple, 2),
    Emotion("😖", "stressed", Colors.yellow, 3),
    Emotion("😄", "happy", Colors.green, 4)
    ];

  List<Emotion> all_emotions = [
    Emotion("😡", "angary", Colors.red, 0),
    Emotion("😭", "sad", Colors.blue, 1),
    Emotion("🥱", "tired", Colors.purple, 2),
    Emotion("😖", "stressed", Colors.yellow, 3),
    Emotion("😄", "happy", Colors.green, 4)
    ];
  


  List<Emotion> getCurEmotions(){
    return cur_emotions;
  }

  addEmotion(String emoji, String name, Color color) {
    Emotion emotion = Emotion(emoji, name, color, all_emotions.length);
    this.all_emotions.add(emotion);
    this.cur_emotions.add(emotion);
  }

  removeCurEmotionByID(int id){
    Emotion emot = cur_emotions.firstWhere((emot) => emot.id == id);
    cur_emotions.remove(emot);
  }

  Emotion getEmotionByID(int id) {
    return all_emotions.firstWhere((emot) => emot.id == id);
  }

  int getCurEmotionLimit() {
    return 5;
  }
}

