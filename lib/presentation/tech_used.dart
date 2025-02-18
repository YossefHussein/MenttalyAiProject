import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TechInfo {
  String nameOfTechnology;
  String url;

  TechInfo({required this.url, required this.nameOfTechnology});
}

class TechUsedScreen extends StatelessWidget {

  Future<void> openUrl(url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  List<TechInfo> techInfoList = [
    TechInfo(
      nameOfTechnology: 'NodeJS',
      url: 'https://nodejs.org/en',
    ),
    TechInfo(
      nameOfTechnology: 'Express',
      url: 'https://expressjs.com/',
    ),
    TechInfo(
      nameOfTechnology: 'pg',
      url: 'https://www.npmjs.com/package/pg',
    ),
    TechInfo(
      nameOfTechnology: '@google/generative-ai',
      url: 'https://www.npmjs.com/package/@google/generative-ai',
    ),
    TechInfo(
      nameOfTechnology: 'cors',
      url: 'https://www.npmjs.com/package/cors',
    ),
    TechInfo(
      nameOfTechnology: 'dotenv',
      url: 'https://www.npmjs.com/package/dotenv',
    ), TechInfo(
      nameOfTechnology: 'nodemon',
      url: 'https://www.npmjs.com/package/nodemon',
    ),
  ];

  TechUsedScreen({super.key});

  techUsed(TechInfo model) {
    return GestureDetector(
      onTap: () {
        openUrl(model.url);
      },
      child: Text(model.nameOfTechnology,style: TextStyle(color: Colors.blue.shade800),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: techInfoList.length,
          itemBuilder: (context, index) => techUsed(techInfoList[index]),
        ),
      ),
    );
  }
}
