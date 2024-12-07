import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mental_health_app/features/presentation/meditation/data/model/daily_quote_model.dart';
import 'package:mental_health_app/features/presentation/meditation/data/model/mood_message_model.dart';

abstract class MeditationRemoteDataSource {
  Future<DailyQuoteModel> getDailyQuote();
  Future<MoodMessageModel> getMoodMessage(String mood);
}

class MeditationRemoteDatasourceImpl implements MeditationRemoteDataSource{
  late final http.Client client;

  MeditationRemoteDatasourceImpl({required this.client});
  @override
  Future<DailyQuoteModel> getDailyQuote() async {
    // get the api url and parsing from string to url
    // from [client] use get method to getting data form api
    final response = await client.get(Uri.parse('http://192.168.1.4:6000/meditation/dailyQuote'));
    // print('statusCode ${response.statusCode}');
    if (response.statusCode == 200) {
      // make list and from [response] to getting the response from api to and decoding as list [jsonResponse]
      final jsonResponse = json.decode(response.body);
      return DailyQuoteModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load daily quote');
    }
  }

  @override
  Future<MoodMessageModel> getMoodMessage(String mood) async {
    // get the api url and parsing from string to url
    // from [client] use get method to getting data form api
    final response = await client.get(Uri.parse('http://192.168.1.4:6000/meditation/myMood/$mood'));
    // print('statusCode ${response.statusCode}');
    if (response.statusCode == 200) {
      // make list and from [response] to getting the response from api to and decoding as list [jsonResponse]
      final jsonResponse = json.decode(response.body);
      return MoodMessageModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load mood quote');
    }
  }
  
}