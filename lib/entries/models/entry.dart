import 'package:echolog/emotion_ratings/models/emotion_rating.dart';

class Entry {
  DateTime timestamp;
  String name;
  String recordingPath;
  List<EmotionRating> ratings;

  Entry(this.timestamp, this.name, this.recordingPath, this.ratings);

  DateTime getTimestamp() {
    return timestamp;
  }

  String getName() {
    return name;
  }

  String getRecordingPath() {
    return recordingPath;
  }

  List<EmotionRating> getRatings() {
    return ratings;
  }
}
