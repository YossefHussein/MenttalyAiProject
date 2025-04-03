import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sign_in_button/sign_in_button.dart';

class AboutDeveloper extends StatefulWidget {
  const AboutDeveloper({super.key});

  @override
  State<AboutDeveloper> createState() => _AboutDeveloperState();
}

class _AboutDeveloperState extends State<AboutDeveloper> {
  Future<void> openUrl(url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 52,
                backgroundColor: DefaultColors.orange,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/81009531?s=400&u=9c1942390c70f9fb2f1d84efba50889a36d0be31&v=4'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SignInButton(
                    Buttons.gitHub,
                    mini: true,
                    onPressed: () {
                      openUrl('https://github.com/YossefHussein');
                    },
                  ),
                  SignInButton(
                    Buttons.twitter,
                    mini: true,
                    onPressed: () {
                      openUrl('https://x.com/YossefHussinDev');
                    },
                  ),
                  SignInButton(
                    Buttons.linkedIn,
                    mini: true,
                    onPressed: () {
                      openUrl(
                          'https://www.linkedin.com/in/youssef-hussein-aa3b38277/');
                    },
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                    'Full-Stack Developer with building scalable mobile apps using JavaScript & Dart(Flutter, Node.js) with a focus on clean architecture and user-centric design.'),
                alignment: Alignment.topLeft,
              )
            ],
          ),
        ),
      ),
    );
  }
}
