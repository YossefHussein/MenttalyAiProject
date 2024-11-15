import 'package:mental_health_app/features/presentation/meditation/domain/entities/daily_quotes.dart';

class DailyQuoteModel extends DailyQuote {
  DailyQuoteModel({
    required super.morningQuote,
    required super.noonQuote,
    required super.eveningQuote,
  });

  factory DailyQuoteModel.fromJson(Map<String, dynamic> json) {
    final quotes = json['text'];
    return DailyQuoteModel(
      morningQuote: quotes['morningQuote'],
      noonQuote: quotes['noonQuote'],
      eveningQuote: quotes['eveningQuote'],
    );
  }
}
