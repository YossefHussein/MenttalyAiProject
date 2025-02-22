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
import 'package:mental_health_app/features/presentation/meditation/widgets/custom_mood_bottomsheet.dart';
import 'package:mental_health_app/features/presentation/meditation/widgets/drawer_widget.dart';
import 'package:mental_health_app/features/presentation/meditation/widgets/feeling_button.dart';
import 'package:mental_health_app/features/presentation/meditation/widgets/task_card.dart';
import 'package:mental_health_app/translations/locale_keys.dart';

class MeditationScreen extends StatelessWidget {
  MeditationScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: DefaultColors.white,
        elevation: 0,
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
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 16,
                children: [
                  FeelingButton(
                      label: LocaleKeys.home_screen_happy_mood_button.tr(),
                      image: 'assets/happy.png',
                      color: DefaultColors.pink,
                      onTap: () {
                        context
                            .read<MoodMessageBloc>()
                            .add(FetchMoodMessageEvent('Today i am happy'));
                      }),
                  FeelingButton(
                      label: LocaleKeys.home_screen_calm_mood_button.tr(),
                      image: 'assets/calm.png',
                      color: DefaultColors.purple,
                      onTap: () {
                        context
                            .read<MoodMessageBloc>()
                            .add(FetchMoodMessageEvent('Today i am calm'));
                      }),
                  FeelingButton(
                      label: LocaleKeys.home_screen_relax_mood_button.tr(),
                      image: 'assets/relax.png',
                      color: DefaultColors.orange,
                      onTap: () {
                        context
                            .read<MoodMessageBloc>()
                            .add(FetchMoodMessageEvent('Today i am relax'));
                      }),
                  FeelingButton(
                      label: LocaleKeys.home_screen_focus_mood_button.tr(),
                      image: 'assets/focus.png',
                      color: DefaultColors.lightTeal,
                      onTap: () {
                        context.read<MoodMessageBloc>().add(
                            FetchMoodMessageEvent('Today i need to be focus'));
                      }),
                  FeelingButton(
                    label: LocaleKeys.home_screen_my_mood_button.tr(),
                    image: 'assets/custom_mood3.png',
                    color: DefaultColors.white,
                    onTap: () {
                      // context.read<MoodMessageBloc>().add(FetchMoodMessageEvent(
                      //     'Today i need to be focus but feel like i am missing something'));
                      bottomSheet(context);
                    },
                    borderColor: Colors.black,
                  ),
                ],
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
