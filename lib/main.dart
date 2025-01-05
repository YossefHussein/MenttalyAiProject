import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/auth_screens/cubit/auth_cubit.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/meditation_bloc.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/meditation_event.dart';
import 'package:mental_health_app/features/presentation/meditation/data/datasource/meditation_remote_datasource.dart';
import 'package:mental_health_app/features/presentation/meditation/data/reposiroty/meditation_repository_impl.dart';
import 'package:mental_health_app/features/presentation/meditation/domain/usecase/get_daily_quote.dart';
import 'package:mental_health_app/features/presentation/meditation/domain/usecase/get_mood_message.dart';
import 'package:mental_health_app/features/presentation/music/bloc/song_bloc.dart';
import 'package:mental_health_app/features/presentation/music/bloc/song_event.dart';
import 'package:mental_health_app/features/presentation/music/data/datasource/song_remote_datasource.dart';
import 'package:mental_health_app/features/presentation/music/data/repository/song_repository_impl.dart';
import 'package:mental_health_app/features/presentation/music/domain/usecases/get_all_songs.dart';
import 'package:http/http.dart' as http;
import 'package:mental_health_app/firebase_options.dart';
import 'package:mental_health_app/presentation/home_screen/home_screen.dart';
import 'package:mental_health_app/presentation/onboarding.dart';
import 'presentation/bottom_nav_bar/bloc/navigation_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
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
        BlocProvider(
          create: (_) => MeditationBloc(
            getMoodMessage: GetMoodMessage(
              repository: MeditationRepositoryImpl(
                remoteDataSource: MeditationRemoteDataSourceImpl(
                  client: http.Client(),
                ),
              ),
            ),
            // get the Daily quote
            getDailyQuote: GetDailyQuote(
              repository: MeditationRepositoryImpl(
                remoteDataSource: MeditationRemoteDataSourceImpl(
                  client: http.Client(),
                ),
              ),
            ),
          )..add(FetchDailyQuoteEvent()),
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
          )..add(FetchSongs()),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
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
