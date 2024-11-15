import 'package:flutter/material.dart';

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
    );
  }
}
