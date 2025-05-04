import 'package:flutter/material.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:clipboard/clipboard.dart';
import 'package:mental_health_app/features/presentation/auth_screens/widgets/widgets.dart';

class AboutDeveloper extends StatefulWidget {
  const AboutDeveloper({super.key});

  @override
  State<AboutDeveloper> createState() => _AboutDeveloperState();
}

Future<void> openUrl(url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

class _AboutDeveloperState extends State<AboutDeveloper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // youssef
              SizedBox(height: 10),
              const CircleAvatar(
                radius: 53,
                backgroundColor: DefaultColors.orange,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/81009531?s=400&u=9c1942390c70f9fb2f1d84efba50889a36d0be31&v=4'),
                ),
              ),
              Text('Youssef EL-Wazzer'),
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
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.topLeft,
                child: Text(
                    'Full-Stack Developer with building scalable mobile apps using JavaScript & Dart(Flutter, Node.js) with a focus on clean architecture and user-centric design.'),
              ),
              // makary
              SizedBox(height: 10),
              const CircleAvatar(
                radius: 52,
                backgroundColor: DefaultColors.orange,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://res.cloudinary.com/dnhljjyzg/image/upload/v1744720978/profile%20pic/mental_health_app/developers%20photos/makary.jpg'),
                ),
              ),
              Text('Makary'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SignInButton(
                    Buttons.facebook,
                    mini: true,
                    onPressed: () {
                      openUrl(
                          'https://www.facebook.com/profile.php?id=100028852187804&locale=ar_AR');
                    },
                  ),
                  SignInButton(
                    Buttons.email,
                    mini: true,
                    onPressed: () {
                      FlutterClipboard.copy('mkarybshyr2@gmail.com')
                          .then((value) => sendMSG('mkarybshyr2@gmail.com'));
                    },
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.topLeft,
                child: const Text('He work on nodejs and DataBase In Project.'),
              ),
              // assem
              SizedBox(height: 10),
              const CircleAvatar(
                radius: 52,
                backgroundColor: DefaultColors.orange,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://res.cloudinary.com/dnhljjyzg/image/upload/v1744721102/profile%20pic/mental_health_app/developers%20photos/assam.jpg'),
                ),
              ),
              Text('Assem'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SignInButton(
                    Buttons.facebook,
                    mini: true,
                    onPressed: () {
                      openUrl('https://github.com/YossefHussein');
                    },
                  ),
                  SignInButton(
                    Buttons.email,
                    mini: true,
                    onPressed: () {
                      openUrl('mkarybshyr2@gmail.com');
                    },
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.topLeft,
                child: const Text('He work on ERD & DataBase by PostgreSQL'),
              ),

              // Mohamed Aed
              SizedBox(height: 10),
              const CircleAvatar(
                radius: 52,
                backgroundColor: DefaultColors.orange,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://res.cloudinary.com/dnhljjyzg/image/upload/v1744721020/profile%20pic/mental_health_app/developers%20photos/mohamed_eldamonhry.jpg'),
                ),
              ),
              Text('Mohamed Aed El-damnhory'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SignInButton(
                    Buttons.facebook,
                    mini: true,
                    onPressed: () {
                      openUrl('https://github.com/YossefHussein');
                    },
                  ),
                  SignInButton(
                    Buttons.email,
                    mini: true,
                    onPressed: () {
                      openUrl('mkarybshyr2@gmail.com');
                    },
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.topLeft,
                child: const Text('He work on presentation'),
              ),
              // fars
              SizedBox(height: 10),
              const CircleAvatar(
                radius: 52,
                backgroundColor: DefaultColors.orange,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://res.cloudinary.com/dnhljjyzg/image/upload/v1744721204/profile%20pic/mental_health_app/developers%20photos/fares.jpg'),
                ),
              ),
              Text('Fars & Mohamed'),
              Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.topLeft,
                child: const Text('He work with me on nodejs'),
              ),
              // youssef amr
              SizedBox(height: 10),
              const CircleAvatar(
                radius: 52,
                backgroundColor: DefaultColors.orange,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://res.cloudinary.com/dnhljjyzg/image/upload/v1746093458/profile%20pic/mental_health_app/developers%20photos/urnhpknmoe9eytxib8rv.png'),
                ),
              ),
              Text('Youssef Amr'),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     SignInButton(
              //       Buttons.facebook,
              //       mini: true,
              //       onPressed: () {
              //         openUrl('https://res.cloudinary.com/dnhljjyzg/image/upload/v1746093458/profile%20pic/mental_health_app/developers%20photos/urnhpknmoe9eytxib8rv.png');
              //       },
              //     ),
              //     SignInButton(
              //       Buttons.email,
              //       mini: true,
              //       onPressed: () {
              //         openUrl('mkarybshyr2@gmail.com');
              //       },
              //     ),
              //   ],
              // ),
              Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.topLeft,
                child: const Text('He work on research on new music'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
