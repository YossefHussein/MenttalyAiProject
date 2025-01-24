import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GetDoctor extends StatelessWidget {
  const GetDoctor({super.key});

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