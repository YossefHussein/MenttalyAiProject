import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AboutDeveloper extends StatefulWidget {
  const AboutDeveloper({super.key});

  @override
  State<AboutDeveloper> createState() => _AboutDeveloperState();
}

class _AboutDeveloperState extends State<AboutDeveloper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Lottie.asset('assets/animation/coming_soon.json'),
      ),
    );
  }
}
