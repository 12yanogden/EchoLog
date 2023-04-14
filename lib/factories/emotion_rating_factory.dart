import 'package:echolog/emotion_ratings/models/emotion_rating.dart';
import 'package:echolog/emotions/models/emotion.dart';
import 'package:echolog/factories/emotion_factory.dart';
import 'package:faker/faker.dart';

class EmotionRatingFactory {
  EmotionFactory emotionFactory = EmotionFactory();
  Faker faker = Faker();

  List<EmotionRating> makeEmotionRatings() {
    List<Emotion> emotions = emotionFactory.makeEmotions();
    List<EmotionRating> emotionRatings = [];

    for (Emotion emotion in emotions) {
      emotionRatings
          .add(EmotionRating(emotion, faker.randomGenerator.integer(5)));
    }

    return emotionRatings;
  }
}
