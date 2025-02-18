import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mental_health_app/core/routes.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/auth_screens/cubit/auth_cubit.dart';
import 'package:mental_health_app/features/presentation/auth_screens/pages/login_page.dart';
import 'package:mental_health_app/features/presentation/auth_screens/pages/logup_page.dart';
import 'package:mental_health_app/features/presentation/chat_gemini/chat_with_gemini.dart';
import 'package:mental_health_app/features/presentation/get_doctor/bloc/doctor_bloc.dart';
import 'package:mental_health_app/features/presentation/get_doctor/bloc/doctor_event.dart';
import 'package:mental_health_app/features/presentation/get_doctor/page/get_doctor.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/daily_quotes/daily_quotes_bloc.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/daily_quotes/daily_quotes_event.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/mode_message/mode_message_bloc.dart';
import 'package:mental_health_app/features/presentation/meditation/page/meditation_screen.dart';
import 'package:mental_health_app/features/presentation/music/bloc/song_bloc.dart';
import 'package:mental_health_app/features/presentation/music/bloc/song_event.dart';
import 'package:mental_health_app/features/presentation/music/page/playlist_screen.dart';
import 'package:mental_health_app/firebase_options.dart';
import 'package:mental_health_app/observer.dart';
import 'package:mental_health_app/presentation/about_developer.dart';
import 'package:mental_health_app/presentation/auth.dart';
import 'package:mental_health_app/presentation/home_screen/home_screen.dart';
import 'package:mental_health_app/presentation/onboarding.dart';
import 'package:mental_health_app/presentation/tech_used.dart';
import 'package:mental_health_app/translations/codegen_loader.g.dart';
import 'presentation/bottom_nav_bar/bloc/navigation_bloc.dart';
import 'injection_container.dart' as di;
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  // to fix problem when make async main function
  WidgetsFlutterBinding.ensureInitialized();
  // Initialized the localization
  await EasyLocalization.ensureInitialized();
  // Observer is class watch the movement state of bloc
  Bloc.observer = MyBlocObserver();
  // reading .env file
  await dotenv.load(fileName: ".env");
  // initialize the firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // dependency injection
  await di.init();
  // adding ads
  // await MobileAds.instance.initialize();

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      // ignore: prefer_const_constructors
      fallbackLocale: Locale('en'),
      // ignore: prefer_const_constructors
      assetLoader: CodegenLoader(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    initialLocation: Routes.authScreenRoute,
    routes: [
      // for bottom nav bar
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeScreen();
        },
        // screen of bottom nav
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: Routes.meditationScreenRoute,
                path: Routes.meditationScreenRoute,
                pageBuilder: (context, state) =>  NoTransitionPage(
                  child: MeditationScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: Routes.playlistScreenRoute,
                path: Routes.playlistScreenRoute,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: PlaylistScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: Routes.chatWithGeminiScreenRoute,
                path: Routes.chatWithGeminiScreenRoute,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ChatWithGeminiScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: Routes.getDoctorScreenRoute,
                path: Routes.getDoctorScreenRoute,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: GetDoctorScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
      // auth
      GoRoute(
        name: Routes.authScreenRoute,
        path: Routes.authScreenRoute,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: Auth(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      // log in
      GoRoute(
        name: Routes.logInScreenRoute,
        path: Routes.logInScreenRoute,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: LogInScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      // log up
      GoRoute(
        name: Routes.logUpScreenRoute,
        path: Routes.logUpScreenRoute,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: LogUpScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      // about developer
      GoRoute(
        name: Routes.aboutDeveloperScreenRoute,
        path: Routes.aboutDeveloperScreenRoute,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: AboutDeveloper(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      // tech used
      GoRoute(
        name: Routes.techUsedScreenRoute,
        path: Routes.techUsedScreenRoute,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: TechUsedScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      // onboarding 
      GoRoute(
        name: Routes.onboardingScreenRoute,
        path: Routes.onboardingScreenRoute,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: OnboardingScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NavigationBloc(),
        ),
        BlocProvider(create: (context) => di.sl<SongBloc>()..add(FetchSongs())),
        BlocProvider(
            create: (context) =>
                di.sl<GetDoctorBloc>()..add(FetchDoctorInfo())),
        BlocProvider(
            create: (context) =>
                di.sl<DailyQuotesBloc>()..add(FetchDailyQuoteEvent())),
        BlocProvider(create: (context) => di.sl<MoodMessageBloc>()),
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: true,
        title: 'Mental Health App',
        theme: AppTheme.lightTheme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        // home: Auth(),
        routerConfig: _router,
      ),
    );
  }
}
