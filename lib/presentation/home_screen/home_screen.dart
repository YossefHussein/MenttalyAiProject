import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_app/features/presentation/meditation/page/meditation_screen.dart';
import 'package:mental_health_app/features/presentation/music/page/playlist_screen.dart';
import 'package:mental_health_app/features/presentation/music/page/song_screen.dart';
import 'package:mental_health_app/presentation/bottom_nav_bar/bloc/navigation_bloc.dart';
import 'package:mental_health_app/presentation/bottom_nav_bar/bloc/navigation_states.dart';
import 'package:mental_health_app/presentation/bottom_nav_bar/widget/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> pages = [
    MeditationScreen(),
    PlaylistScreen(),
  ];
  //  this to adding active color
  BottomNavigationBarItem createBottomNavigationBarItem({
    required String assetName,
    required bool isActive,
    required BuildContext context,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        assetName,
        // this to change color of icon when the user
        // click on button nav bar
        color: isActive
            ? Theme.of(context).focusColor
            : Theme.of(context).primaryColor,
      ),
      label: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          // if state in [NavigationChanged]
          if (state is NavigationChanged) {
            // this mean return page and change with change the index
            return pages[state.index];
          }
          // this to see what is state in
          debugPrint("state $state");
          // this is return the first screen [MeditationScreen]
          return pages[0];
        },
      ),
      // adding bloc builder to
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          int currentIndex = 0;
          //  when state in [NavigationChanged] change the index
          if (state is NavigationChanged) {
            currentIndex = state.index;
          }
          final List<BottomNavigationBarItem> bottomNavBarItem = [
            createBottomNavigationBarItem(
              assetName: 'assets/menu_home.png',
              // when use this trick you not assign
              // int to bool but you like ask compiler if [currentIndex]
              // equal zero  convert to true if not that change the color of song button [primaryColor]
              isActive: currentIndex == 0,
              context: context,
            ),
            createBottomNavigationBarItem(
              assetName: 'assets/menu_songs.png',
              isActive: currentIndex == 1,
              context: context,
            ),
          ];
          return BottomNavBar(
            items: bottomNavBarItem,
            currentIndex: currentIndex,
          );
        },
      ),
    );
  }
}
