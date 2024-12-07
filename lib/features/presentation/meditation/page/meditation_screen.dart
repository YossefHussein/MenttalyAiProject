import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/meditation_bloc.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/meditation_state.dart';
import 'package:mental_health_app/features/presentation/meditation/widgets/drawer_widget.dart';
import 'package:mental_health_app/features/presentation/meditation/widgets/feeling_button.dart';
import 'package:mental_health_app/features/presentation/meditation/widgets/task_card.dart';

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
        leading: InkWell(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            child: Image.asset('assets/menu_burger.png')),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage('assets/girl_profile.jpg'),
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: Container(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FeelingButton(
                          label: 'Happy',
                          image: 'assets/happy.png',
                          color: DefaultColors.pink,
                          onTap: () {},
                        ),
                        FeelingButton(
                          label: 'Calm',
                          image: 'assets/calm.png',
                          color: DefaultColors.purple,
                          onTap: () {},
                        ),
                        FeelingButton(
                          label: 'Relax',
                          image: 'assets/relax.png',
                          color: DefaultColors.orange,
                          onTap: () {},
                        ),
                        FeelingButton(
                          label: 'Focus',
                          image: 'assets/focus.png',
                          color: DefaultColors.lightTeal,
                          onTap: () {},
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
                      description:
                          'Let\'s open up to the thing that matters among the people ',
                      color: DefaultColors.task2,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TaskCard(
                      title: 'Noon 🌞',
                      description:
                          'Let\'s open up to the thing that matters among the people ',
                      color: DefaultColors.task1,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TaskCard(
                      title: 'Evening 🌙',
                      description:
                          'Let\'s open up to the thing that matters among the people ',
                      color: DefaultColors.task3,
                    ),
                  ],
                ),
              ),
            )
          // } else if (state is MoodMessageLoadedState) {
          //   showDialog(
          //       context: context,
          //       builder: (context) {
          //         return AlertDialog(
          //           title: Text(
          //             'My Message for You : ',
          //             style: Theme.of(context).textTheme.labelSmall,
          //           ),
          //           content: Text(state.moodMessage.text),
          //           actions: [
          //             TextButton(
          //                 onPressed: () {
          //                   Navigator.pop(context);
          //                 },
          //                 child: Text(
          //                   'OK',
          //                   style: Theme.of(context).textTheme.labelSmall,
          //                 ))
          //           ],
          //         );
          //       });
          //   return Container();
          // } else if (state is MeditationErrorState) {
          //   return Center(
          //       child: Text(
          //     state.message,
          //     style: Theme.of(context).textTheme.labelSmall,
          //   ));
          // } else {
          //   return Center(
          //     child: Text(
          //       'No Data Found',
          //       style: Theme.of(context).textTheme.labelSmall,
          //     ),
          //   );
          // }
        // },
      // ),
    );
  }
}
