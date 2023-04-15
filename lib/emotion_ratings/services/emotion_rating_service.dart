import 'package:echolog/emotion_ratings/models/emotion_rating.dart';
import 'package:echolog/factories/emotion_rating_factory.dart';

class EmotionRatingService {
  // Singleton Pattern
  static final EmotionRatingService _instance =
      EmotionRatingService._internal();
  final EmotionRatingFactory emotionRatingFactory = EmotionRatingFactory();
  List<EmotionRating> emotionRatings = [];

  EmotionRatingService._internal();

  factory EmotionRatingService() {
    return _instance;
  }

  void lazyLoadEmotionRatings() {
    if (emotionRatings.isEmpty) emotionRatingFactory.makeEmotionRatings();
  }

  List<EmotionRating> getEmotionRatings() {
    lazyLoadEmotionRatings();

    return emotionRatings;
  }
}
