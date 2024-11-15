import 'package:mental_health_app/features/presentation/meditation/domain/entities/mood_message.dart';

class MoodMessageModel extends MoodMessage{
  MoodMessageModel({required super.text});
  factory MoodMessageModel.fromJson(Map<String , dynamic> json){
    return MoodMessageModel(text: json['text']);
  }
}