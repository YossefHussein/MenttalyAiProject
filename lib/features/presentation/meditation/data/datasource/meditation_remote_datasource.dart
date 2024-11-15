import 'package:mental_health_app/features/presentation/meditation/data/model/daily_quote_model.dart';
import 'package:mental_health_app/features/presentation/meditation/data/model/mood_message_model.dart';

abstract class MeditationRemoteDataSource {
  Future<DailyQuoteModel> getDailyQuote();
  Future<MoodMessageModel> getMoodMessage(String mood);
}