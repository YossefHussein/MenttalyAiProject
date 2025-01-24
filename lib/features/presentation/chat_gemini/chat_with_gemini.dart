
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ChatWithGemini extends StatefulWidget {
  const ChatWithGemini({super.key});

  @override
  State<ChatWithGemini> createState() => _ChatWithGeminiState();
}

class _ChatWithGeminiState extends State<ChatWithGemini> {
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

