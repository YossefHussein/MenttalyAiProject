import 'package:flutter/material.dart';
import 'package:mental_health_app/core/theme.dart';
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FeelingButton(
                    label: 'Happy',
                    image: 'assets/happy.png',
                    color: DefaultColors.pink,
                  ),
                  FeelingButton(
                    label: 'Calm',
                    image: 'assets/calm.png',
                    color: DefaultColors.purple,
                  ),
                  FeelingButton(
                    label: 'Relax',
                    image: 'assets/relax.png',
                    color: DefaultColors.orange,
                  ),
                  FeelingButton(
                    label: 'Focus',
                    image: 'assets/focus.png',
                    color: DefaultColors.lightTeal,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'today\'s text ',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              TaskCard(
                title: 'Morning 🌄',
                description:
                    'Let\'s open up to the thing that matters among the people ',
                actionText: '',
                color: DefaultColors.task2,
              ),
              const SizedBox(
                height: 16,
              ),
              TaskCard(
                title: 'Noon 🌞',
                description:
                    'Let\'s open up to the thing that matters among the people ',
                actionText: '',
                color: DefaultColors.task1,
              ),
              const SizedBox(
                height: 16,
              ),
              TaskCard(
                title: 'Evening 🌙',
                description:
                    'Let\'s open up to the thing that matters among the people ',
                actionText: '',
                color: DefaultColors.task3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
