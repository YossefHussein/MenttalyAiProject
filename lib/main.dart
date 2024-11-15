import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/music/bloc/song_bloc.dart';
import 'package:mental_health_app/features/presentation/music/bloc/song_event.dart';
import 'package:mental_health_app/features/presentation/music/data/datasource/song_remote_datasource.dart';
import 'package:mental_health_app/features/presentation/music/data/repository/song_repository_impl.dart';
import 'package:mental_health_app/features/presentation/music/domain/usecases/get_all_songs.dart';
import 'package:mental_health_app/presentation/home_screen/home_screen.dart';
import 'package:http/http.dart' as http;
import 'presentation/bottom_nav_bar/bloc/navigation_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NavigationBloc(),
        ),
        // adding [SongBloc]
        BlocProvider(
          // create [SongBloc]
          create: (context) => SongBloc(
            // get the data
            getAllSongs: GetAllSongs(
              // from source repo
              repository: SongRepositoryImpl(
                // adding call source to getting the data
                remoteDataSource: SongRemoteDataSourceImpl(
                  client: http.Client(),
                ),
              ),
            ),
          //   adding the state
          )..add(FetchSongs())
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mental Health App',
        theme: AppTheme.lightTheme,
        home: HomeScreen(),
      ),
    );
  }
}
