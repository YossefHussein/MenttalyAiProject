import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/core/theme.dart';

class MusicPlaylistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Image.asset('assets/down_arrow.png'),
        ),
        actions: [
          Image.asset('assets/transcript_icon.png'),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/child_with_dog.png',
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Rain on class',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              'By : Painting with passion',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            ProgressBar(
              progress: Duration(
                microseconds: 5000,
              ),
              total: Duration(
                microseconds: 5000,
              ),
              baseBarColor: DefaultColors.lightpink,
              thumbColor: DefaultColors.pink,
              progressBarColor: DefaultColors.pink,
              onSeek: (duration){
                print('User selected a new time $duration');
              },
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shuffle,
                    color: DefaultColors.pink,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.skip_previous, color: DefaultColors.pink),
                ),
                IconButton(
                  iconSize: 80,
                  onPressed: () {},
                  icon: Icon(Icons.pause_circle_filled_outlined,
                      color: DefaultColors.pink),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.skip_next, color: DefaultColors.pink),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.repeat, color: DefaultColors.pink),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
