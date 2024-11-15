import 'package:mental_health_app/features/presentation/music/domain/entities/song.dart';

class SongModel extends Song {
  // song model extends from song class
  SongModel({
    required super.id,
    required super.title,
    required String author,
    required String songLink,
  }) : super(
          authors: author,
          songLike: songLink,
        );
  // this named constructor to convert to json and it using for example [SongRemoteDataSourceImpl]
  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      songLink: json['songLink'],
    );
  }
}
