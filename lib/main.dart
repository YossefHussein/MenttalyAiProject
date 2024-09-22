import 'package:flutter/material.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentaion/pages/meditation_screen.dart';
import 'package:mental_health_app/presentaion/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,

      home: const MeditationScreen(),
    );
  }
}
