import 'package:flutter/material.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/music/page/song_screen.dart';

class PlaylistScreen extends StatelessWidget {
  PlaylistScreen({super.key});

  final List<Map<String, String>> song = [
    {
      'title': 'rain on glass',
      'artist': 'rain on glass',
      'thumbnail': 'assets/child_with_dog.png',
    },
    {
      'title': 'gentle breeze',
      'artist': 'armando kover',
      'thumbnail': 'assets/child_with_dog.png',
    },
    {
      'title': 'petter arkove',
      'artist': 'petter arkove',
      'thumbnail': 'assets/child_with_dog.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PlayList',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: DefaultColors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: DefaultColors.white,
        child: ListView.builder(
          itemCount: song.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(song[index]['thumbnail']!),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text(
                song[index]['title']!,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              subtitle: Text(
                song[index]['artist']!,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MusicPlaylistScreen(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
