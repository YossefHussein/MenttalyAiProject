import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/get_doctor/domain/entities/doctor.dart';
import 'package:mental_health_app/features/presentation/music/domain/entities/song.dart';

void doctorBottomSheet(BuildContext context,
    {required DoctorEntities get_doctor}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return GetDoctorBottomSheet(
        doctor: get_doctor,
      );
    },
  );
}

class GetDoctorBottomSheet extends StatefulWidget {
  final DoctorEntities doctor;

  const GetDoctorBottomSheet({super.key, required this.doctor});

  @override
  State<GetDoctorBottomSheet> createState() => _GetDoctorBottomSheetState();
}

class _GetDoctorBottomSheetState extends State<GetDoctorBottomSheet> {
  // BannerAd? _bannerAd;

  @override
  void initState() {
    // config of ads
    // _bannerAd = BannerAd(
    //   adUnitId: 'ca-app-pub-3541561665141480/1576506826',
    //   request: AdRequest(),
    //   size: AdSize.banner,
    //   listener:  BannerAdListener(
    //     onAdLoaded: (ad) => debugPrint('Ad Loaded'),
    //     onAdFailedToLoad: (ad, error) {
    //       ad.dispose();
    //       debugPrint('Ad failed to load $error');
    //     },
    //     onAdClosed: (ad) => debugPrint('Ad closed'),
    //   ),
    // )..load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 650,
      child: Container(
        margin: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // Using Wrap makes the height dynamic
            Wrap(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  // Ensures the column takes only the necessary space
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: widget.doctor.doctorPhoto,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AutoSizeText(
                      widget.doctor.title,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    AutoSizeText(
                      'place : ${widget.doctor.place}',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
