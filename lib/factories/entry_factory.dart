import 'package:echolog/emotion_ratings/models/emotion_rating.dart';
import 'package:echolog/entries/models/entry.dart';
import 'package:echolog/factories/emotion_rating_factory.dart';
import 'package:faker/faker.dart';

class EntryFactory {
  EmotionRatingFactory emotionRatingFactory = EmotionRatingFactory();
  Faker faker = Faker();

  List<Entry> makeEntries() {
    int entryMakeCount = 5;
    List<Entry> entries = [];

    for (int i = 0; i < entryMakeCount; i++) {
      DateTime timestamp = faker.date.dateTime(minYear: 2022, maxYear: 2023);
      String recordingPath = faker.randomGenerator.string(20);
      String name = faker.randomGenerator.string(10);
      List<EmotionRating> emotionRatings =
          emotionRatingFactory.makeEmotionRatings();

      entries.add(Entry(timestamp, name, recordingPath, emotionRatings));
    }

    return entries;
  }
}
