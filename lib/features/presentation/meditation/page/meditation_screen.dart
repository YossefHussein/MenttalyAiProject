import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/meditation_bloc.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/meditation_event.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/meditation_state.dart';
import 'package:mental_health_app/features/presentation/meditation/widgets/drawer_widget.dart';
import 'package:mental_health_app/features/presentation/meditation/widgets/feeling_button.dart';
import 'package:mental_health_app/features/presentation/meditation/widgets/task_card.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Meditation',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leading: InkWell(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            child: Image.asset('assets/menu_burger.png')),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/girl_profile.jpg'),
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: BlocBuilder<MeditationBloc, MeditationState>(
        builder: (context, state) {
          // if the state in make LinearProgressIndicator
          if (state is MeditationLoadingState) {
            return const LinearProgressIndicator(
              color: DefaultColors.pink,
            );
          } else if (state is DailyQuoteLoadedState) {
            // if state in daily quote make daily widget
            return Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back sabrina',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text('How are you feeling today?',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(
                      height: 16,
                    ),
                    // this buttons for say to back-end the mode of user
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FeelingButton(
                          label: 'Happy',
                          image: 'assets/happy.png',
                          color: DefaultColors.pink,
                          onTap: () {
                            // this function send to backend the mode of user
                            context
                                .read<MeditationBloc>()
                                .add(FetchMoodMessageEvent('today i am happy'));
                          },
                        ),
                        FeelingButton(
                          label: 'Calm',
                          image: 'assets/calm.png',
                          color: DefaultColors.purple,
                          onTap: () {
                            context
                                .read<MeditationBloc>()
                                .add(FetchMoodMessageEvent('today i am calm'));
                          },
                        ),
                        FeelingButton(
                          label: 'Relax',
                          image: 'assets/relax.png',
                          color: DefaultColors.orange,
                          onTap: () {
                            context
                                .read<MeditationBloc>()
                                .add(FetchMoodMessageEvent('today i am Relax'));
                          },
                        ),
                        FeelingButton(
                          label: 'Focus',
                          image: 'assets/focus.png',
                          color: DefaultColors.lightTeal,
                          onTap: () {
                            context.read<MeditationBloc>().add(
                                FetchMoodMessageEvent(
                                    'today i am want to be focus but feel like i am missing something'));
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Today\'s Quote ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TaskCard(
                      title: 'Morning 🌄',
                      description: state.dailyQuote.morningQuote,
                      color: DefaultColors.task2,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TaskCard(
                      title: 'Noon 🌞',
                      description: state.dailyQuote.noonQuote,
                      color: DefaultColors.task1,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TaskCard(
                      title: 'Evening 🌙',
                      description: state.dailyQuote.eveningQuote,
                      color: DefaultColors.task3,
                    ),
                  ],
                ),
              ),
            );
          } else if (state is MoodMessageLoadedState) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: AutoSizeText(
                        'My Message for You : ',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      content: Text(state.moodMessage.text),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: AutoSizeText(
                            'OK',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                      ],
                    );
                  });
            });

            return Container();
          } else if (state is MeditationErrorState) {
            return Center(
                child: AutoSizeText(
              state.message.toString(),
              style: Theme.of(context).textTheme.labelSmall,
            ));
          } else {
            return Center(
              child: AutoSizeText(
                'No Data Found',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            );
          }
        },
      ),
    );
  }
}
