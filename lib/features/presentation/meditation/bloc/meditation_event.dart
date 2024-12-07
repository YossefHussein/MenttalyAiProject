abstract class MeditationEvent{}

class FetchDailyQuoteEvent extends MeditationEvent {}

// get the message of mood
class FetchMoodMessageEvent extends MeditationEvent {
  final String mood;

  FetchMoodMessageEvent(this.mood);
}