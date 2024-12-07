import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/music/bloc/song_bloc.dart';
import 'package:mental_health_app/features/presentation/music/bloc/song_state.dart';
import 'package:mental_health_app/features/presentation/music/data/datasource/song_remote_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:mental_health_app/features/presentation/music/widgets/songs_bottomsheet.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

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
      body: BlocBuilder<SongBloc, SongState>(
        builder: (context, state) {
          if (state is SongLoading) {
            // display a loader
            return const LinearProgressIndicator(
              color: DefaultColors.pink,
            );
          } else if (state is SongLoaded) {
            // display all the information
            return ListView.builder(
              itemCount: state.songs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/child_with_dog.png'),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: Text(
                    state.songs[index].title,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  subtitle: Text(
                    state.songs[index].authors,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  onTap: () {
                    bottomSheet(
                      context,
                      songs: state.songs[index],
                    );
                  },
                );
              },
            );
          } else if (state is SongError) {
            // display an error
            return Center(
              child: Text(
                state.message.toString(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            );
          } else {
            return Center(
              child: Text(
                'No Songs Found',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            );
          }
        },
      ),
    );
  }
}
