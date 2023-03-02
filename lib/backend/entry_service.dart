import 'package:echo_log/models/emotion_rating.dart';
import 'package:echo_log/models/entry.dart';

import '../models/emotion.dart';
import 'package:flutter/material.dart';

class EntryService {
  // Singleton Pattern----------------
  static final EntryService _instance = EntryService._internal();

  List<Entry> entries = [
    Entry(DateTime.now().subtract(Duration(days: 1)),
        "../assets/fakeDataRecording.mp4", [
      EmotionRating(0, 1),
      EmotionRating(1, 3),
      EmotionRating(2, 3),
      EmotionRating(3, 4),
      EmotionRating(4, 5)
    ]),
    Entry(DateTime.now().subtract(Duration(days: 2)),
        "../assets/fakeDataRecording.mp4", [
      EmotionRating(0, 5),
      EmotionRating(1, 4),
      EmotionRating(2, 3),
      EmotionRating(3, 2),
      EmotionRating(4, 1)
    ]),
    Entry(DateTime.now().subtract(Duration(days: 3)),
        "../assets/fakeDataRecording.mp4", [
      EmotionRating(0, 1),
      EmotionRating(1, 2),
      EmotionRating(2, 3),
      EmotionRating(3, 4),
      EmotionRating(4, 5)
    ]),
    Entry(DateTime.now().subtract(Duration(days: 4)),
        "../assets/fakeDataRecording.mp4", [
      EmotionRating(0, 5),
      EmotionRating(1, 4),
      EmotionRating(2, 3),
      EmotionRating(3, 2),
      EmotionRating(4, 1)
    ]),
    Entry(DateTime.now().subtract(Duration(days: 5)),
        "../assets/fakeDataRecording.mp4", [
      EmotionRating(0, 1),
      EmotionRating(1, 2),
      EmotionRating(2, 3),
      EmotionRating(3, 4),
      EmotionRating(4, 5)
    ]),
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
