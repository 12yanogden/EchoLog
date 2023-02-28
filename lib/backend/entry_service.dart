import 'package:echo_log/models/emotion_rating.dart';
import 'package:echo_log/models/entry.dart';

import '../models/emotion.dart';
import 'package:flutter/material.dart';

class EntryService {
  // Singleton Pattern----------------
  static final EntryService _instance = EntryService._internal();

  List<Entry> entries = [
    Entry(DateTime.now().subtract(Duration(days: 1)), "", [
      EmotionRating(Emotion("😡", "angry", Colors.red, 0), 0),
      EmotionRating(Emotion("😭", "sad", Colors.blue, 1), 1),
      EmotionRating(Emotion("🥱", "tired", Colors.purple, 2), 2),
      EmotionRating(Emotion("😖", "stressed", Colors.yellow, 3), 3),
      EmotionRating(Emotion("😄", "happy", Colors.green, 4), 4)
    ]),
    Entry(DateTime.now().subtract(Duration(days: 2)), "", [
      EmotionRating(Emotion("😡", "angry", Colors.red, 0), 4),
      EmotionRating(Emotion("😭", "sad", Colors.blue, 1), 3),
      EmotionRating(Emotion("🥱", "tired", Colors.purple, 2), 2),
      EmotionRating(Emotion("😖", "stressed", Colors.yellow, 3), 1),
      EmotionRating(Emotion("😄", "happy", Colors.green, 4), 0)
    ]),
    Entry(DateTime.now().subtract(Duration(days: 3)), "", [
      EmotionRating(Emotion("😡", "angry", Colors.red, 0), 0),
      EmotionRating(Emotion("😭", "sad", Colors.blue, 1), 1),
      EmotionRating(Emotion("🥱", "tired", Colors.purple, 2), 2),
      EmotionRating(Emotion("😖", "stressed", Colors.yellow, 3), 3),
      EmotionRating(Emotion("😄", "happy", Colors.green, 4), 4)
    ]),
    Entry(DateTime.now().subtract(Duration(days: 4)), "", [
      EmotionRating(Emotion("😡", "angry", Colors.red, 0), 4),
      EmotionRating(Emotion("😭", "sad", Colors.blue, 1), 3),
      EmotionRating(Emotion("🥱", "tired", Colors.purple, 2), 2),
      EmotionRating(Emotion("😖", "stressed", Colors.yellow, 3), 1),
      EmotionRating(Emotion("😄", "happy", Colors.green, 4), 0)
    ]),
    Entry(DateTime.now().subtract(Duration(days: 5)), "", [
      EmotionRating(Emotion("😡", "angry", Colors.red, 0), 0),
      EmotionRating(Emotion("😭", "sad", Colors.blue, 1), 1),
      EmotionRating(Emotion("🥱", "tired", Colors.purple, 2), 2),
      EmotionRating(Emotion("😖", "stressed", Colors.yellow, 3), 3),
      EmotionRating(Emotion("😄", "happy", Colors.green, 4), 4)
    ])
  ];

  EntryService._internal();

  factory EntryService() {
    return _instance;
  }
  // Singleton Pattern---------------

  void addEntry(Entry entry) {
    this.entries.add(entry);
  }

  List<Entry> getAllEntries() {
    return this.entries;
  }
}
