import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/meditation_event.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/meditation_state.dart';
import 'package:mental_health_app/features/presentation/meditation/domain/usecase/get_daily_quote.dart';
import 'package:mental_health_app/features/presentation/meditation/domain/usecase/get_mood_message.dart';

class MeditationBloc extends Bloc<MeditationEvent, MeditationState> {
  final GetDailyQuote getDailyQuote;
  final GetMoodMessage getMoodMessage;

  MeditationBloc({
    required this.getDailyQuote,
    required this.getMoodMessage,
  }) : super(MeditationInitialState()) {
    on<FetchDailyQuoteEvent>((event, emit) async {
      emit(MeditationLoadingState());
      try {
        final dailyQuote = await getDailyQuote();
        emit(DailyQuoteLoadedState(dailyQuote: dailyQuote));
      } catch (error) {
        print(error.toString());
        emit(MeditationErrorState(message: error.toString() ));
      }
    });
    on<FetchMoodMessageEvent>((event, emit) async {
      emit(MeditationLoadingState());
      try {
        final moodMessage = await getMoodMessage(event.mood);
        emit(MoodMessageLoadedState(moodMessage: moodMessage));
      } catch (error) {
        print(error.toString());
        emit(MeditationErrorState(message: error.toString()));
      }
    });
  }
}
