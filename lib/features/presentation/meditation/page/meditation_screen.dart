import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/daily_quotes/daily_quotes_bloc.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/daily_quotes/daily_quotes_state.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/mode_message/mode_message_bloc.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/mode_message/mode_message_event.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/mode_message/mode_message_state.dart';
import 'package:mental_health_app/features/presentation/meditation/data/chart_mode/data_helper.dart';
import 'package:mental_health_app/features/presentation/meditation/data/model/chart_mode_data_model.dart';
import 'package:mental_health_app/features/presentation/meditation/widgets/custom_mood_bottomsheet.dart';
import 'package:mental_health_app/features/presentation/meditation/widgets/drawer_widget.dart';
import 'package:mental_health_app/features/presentation/meditation/widgets/feeling_button.dart';
import 'package:mental_health_app/features/presentation/meditation/widgets/task_card.dart';
import 'package:mental_health_app/translations/locale_keys.dart';
import 'dart:math';

class MeditationScreen extends StatefulWidget {
  MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Widget profilePic() {
    if (FirebaseAuth.instance.currentUser?.photoURL == null) {
      return CircleAvatar(
        child: Icon(Icons.account_circle),
      );
    } else {
      return CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(
            FirebaseAuth.instance.currentUser!.photoURL!),
      );
    }
  }

  late DataBaseHelper dbHelper;
  late int count;
  // late ChartModeDataModel data;

  @override
  void initState() {
    super.initState();
    count = 1;
    dbHelper = DataBaseHelper.instance;
  }

  int getRandomInt(int min, int max) {
    final Random random = Random();
    return min + random.nextInt(max - min);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: DefaultColors.white,
        elevation: 0,
        title: Text('Meditation'),
        leading: GestureDetector(
          onTap: () {
            scaffoldKey.currentState!.openDrawer();
          },
          child: Image.asset('assets/menu_burger.png'),
        ),
        actions: [
          profilePic(),
          SizedBox(
            width: 16,
          )
        ],
      ),
      drawer: DrawerWidget(),
      backgroundColor: DefaultColors.white,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AutoSizeText(
                  //
                  '${LocaleKeys.home_screen_welcome_back.tr()} ${FirebaseAuth.instance.currentUser?.displayName ?? ''}',
                  style: Theme.of(context).textTheme.titleLarge),
              SizedBox(
                height: 25,
              ),
              AutoSizeText(
                LocaleKeys.home_screen_how_are_you_feeling_today.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  // spacing: 16,
                  children: [
                    FeelingButton(
                        label: LocaleKeys.home_screen_happy_mood_button.tr(),
                        image: 'assets/happy.png',
                        color: DefaultColors.pink,
                        onTap: () async {
                          context
                              .read<MoodMessageBloc>()
                              .add(FetchMoodMessageEvent('Today i am happy'));
                          dbHelper.add(
                            ChartModeDataModel(
                              happyXValueNum: count,
                              happyYValueNum: getRandomInt(10, 20),
                            ),
                          );
                          chartModeData = await dbHelper.getDatabase();
                          // Check if currentState is not null before calling setState

                          chartKey.currentState?.setState(() {});

                          count++;
                        }),
                    FeelingButton(
                        label: LocaleKeys.home_screen_calm_mood_button.tr(),
                        image: 'assets/calm.png',
                        color: DefaultColors.purple,
                        onTap: () async {
                          context
                              .read<MoodMessageBloc>()
                              .add(FetchMoodMessageEvent('Today i am calm'));
                          dbHelper.add(
                            ChartModeDataModel(
                              calmXValueNum: count,
                              clamYValueNum: getRandomInt(10, 20),
                            ),
                          );
                          chartModeData = await dbHelper.getDatabase();
                          chartKey.currentState?.setState(
                                () {},
                          );
                          count++;
                        }),
                    FeelingButton(
                        label: LocaleKeys.home_screen_relax_mood_button.tr(),
                        image: 'assets/relax.png',
                        color: DefaultColors.orange,
                        onTap: () async{
                          context
                              .read<MoodMessageBloc>()
                              .add(FetchMoodMessageEvent('Today i am relax'));

                          dbHelper.add(
                            ChartModeDataModel(
                              relaxXValueNum: count,
                              relaxYValueNum: getRandomInt(10, 20),
                            ),
                          );
                          chartModeData = await dbHelper.getDatabase();
                          chartKey.currentState?.setState(
                                () {},
                          );
                          count++;
                        }),
                    FeelingButton(
                        label: LocaleKeys.home_screen_focus_mood_button.tr(),
                        image: 'assets/focus.png',
                        color: DefaultColors.lightTeal,
                        onTap: () async {
                          context.read<MoodMessageBloc>().add(
                                FetchMoodMessageEvent(
                                    'Today i need to be focus'),
                              );
                          dbHelper.add(
                            ChartModeDataModel(
                              focusXValueNum: count,
                              focusYValueNum: getRandomInt(10, 20),
                            ),
                          );
                          chartModeData = await dbHelper.getDatabase();
                          chartKey.currentState?.setState(
                                () {},
                          );
                          count++;
                        }),
                    FeelingButton(
                      label: LocaleKeys.home_screen_my_mood_button.tr(),
                      image: 'assets/custom_mood3.png',
                      color: DefaultColors.white,
                      onTap: () {
                        // open chart mode bottom sheet
                        customMoodBottomSheet(context);
                      },
                      borderColor: Colors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              AutoSizeText(
                LocaleKeys.home_screen_today_task.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 16,
              ),
              BlocBuilder<DailyQuotesBloc, DailyQuotesState>(
                builder: (context, state) {
                  if (state is DailyQuoteLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: DefaultColors.pink,
                      ),
                    );
                  } else if (state is DailyQuoteLoadedState) {
                    return Column(
                      children: [
                        // tasks card
                        TaskCard(
                          title: LocaleKeys.home_screen_morning.tr(),
                          description: state.dailyQuote.morningQuote,
                          color: DefaultColors.task1,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TaskCard(
                          title: LocaleKeys.home_screen_noon.tr(),
                          description: state.dailyQuote.noonQuote,
                          color: DefaultColors.task2,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TaskCard(
                          title: LocaleKeys.home_screen_evening.tr(),
                          description: state.dailyQuote.eveningQuote,
                          color: DefaultColors.task3,
                        )
                      ],
                    );
                  } else if (state is DailyQuoteErrorState) {
                    return Center(
                      child: AutoSizeText(
                        state.message,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    );
                  } else {
                    // if no data found
                    return Center(
                      child: AutoSizeText(
                        LocaleKeys.no_data_found.tr(),
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    );
                  }
                },
              ),
              BlocBuilder<MoodMessageBloc, MoodMessageState>(
                builder: (context, state) {
                  if (state is MoodMessageLoadedState) {
                    WidgetsBinding.instance.addPostFrameCallback(
                      (_) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              'My advice for you',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            content: Text(
                              state.moodMessage.text,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    context
                                        .read<MoodMessageBloc>()
                                        .add(ResetMoodMessage());
                                  },
                                  child: Text(
                                      LocaleKeys.home_screen_okay_button.tr()))
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
