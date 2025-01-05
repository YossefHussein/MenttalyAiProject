import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:mental_health_app/presentation/tech_used.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  /**
      ListView(
      children: [
      DrawerHeader(
      // to delete the padding of drawer header
      padding: EdgeInsets.zero,
      child: Container(
      decoration: BoxDecoration(
      image: DecorationImage(
      image: AssetImage(
      'assets/girl_profile.jpg',
      ),
      fit: BoxFit.cover,
      ),
      ),
      child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
      alignment: Alignment.bottomLeft,
      child: Text(
      'Sabrina',
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
      color: Colors.white,
      ),
      ),
      ),
      ),
      ),
      ),
      const ListTile(
      title: Text('About Developer'),
      )
      ],
      ),
   */

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            // to delete the padding of drawer header
            padding: EdgeInsets.zero,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/girl_profile.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: AutoSizeText(
                    'Sabrina',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ),
          ),
          const ListTile(
            title: AutoSizeText('About Developer'),
          ),
          ListTile(
            title: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TechUsed()));
                },
                child: Text('Tech Used To Make App')),
          ),
        ],
      ),
    );
  }
}
