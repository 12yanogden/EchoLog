import 'package:echo_log/models/emotion_rating.dart';

class Entry {
  DateTime date;
  String recordingPath;
  List<EmotionRating> ratings;

  Entry(this.date, this.recordingPath, this.ratings);
}
