import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/auth_screens/cubit/auth_cubit.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/daily_quotes/daily_quotes_bloc.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/daily_quotes/daily_quotes_event.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/mode_message/mode_message_bloc.dart';
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
import 'package:mental_health_app/observer.dart';
import 'package:mental_health_app/presentation/auth.dart';
import 'presentation/bottom_nav_bar/bloc/navigation_bloc.dart';
import 'injection_container.dart' as di;


Future<void> main() async {
  // to fix problem when make async main function
  WidgetsFlutterBinding.ensureInitialized();
  // Observer is class watch the movement state of bloc
  Bloc.observer = MyBlocObserver();
  // reading .env file
  await dotenv.load(fileName: ".env");
  // initialize the firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // dependency injection
  await di.init();
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
        create: (context) => di.sl<SongBloc>()..add(FetchSongs())
        ),
        BlocProvider(
        create: (context)=> di.sl<DailyQuotesBloc>()..add(FetchDailyQuoteEvent()),
        ),
        BlocProvider(
        create: (context)=> di.sl<MoodMessageBloc>()
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mental Health App',
        theme: AppTheme.lightTheme,
        home: Auth(),
      ),
    );
  }
}
