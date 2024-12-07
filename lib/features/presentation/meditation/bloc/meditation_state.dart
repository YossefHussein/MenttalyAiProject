import 'package:mental_health_app/features/presentation/meditation/domain/entities/daily_quotes.dart';
import 'package:mental_health_app/features/presentation/meditation/domain/entities/mood_message.dart';

abstract class MeditationState {}

class MeditationInitialState extends MeditationState {}

// this for loading the state
class MeditationLoadingState extends MeditationState {}

// if there error in meditation screen get the error in the state
class MeditationErrorState extends MeditationState {
  final String message;

  MeditationErrorState({required this.message});
}

// daily quote loading state
class DailyQuoteLoadedState extends MeditationState {
  final DailyQuote dailyQuote;

  DailyQuoteLoadedState({required this.dailyQuote});
}

class MoodMessageLoadedState extends MeditationState {
  // this is from the model of the to get the text in finally
  final MoodMessage moodMessage;

  MoodMessageLoadedState({required this.moodMessage});
}
