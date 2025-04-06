import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mental_health_app/core/ads_helper.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/get_doctor/domain/entities/doctor.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

void doctorBottomSheet(BuildContext context,
    {required DoctorEntities getDoctor}) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      // This allows the sheet to take up more space if needed
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return GetDoctorBottomSheet(
          doctor: getDoctor,
        );
      });
}

class GetDoctorBottomSheet extends StatefulWidget {
  final DoctorEntities doctor;

  const GetDoctorBottomSheet({super.key, required this.doctor});

  @override
  State<GetDoctorBottomSheet> createState() => _GetDoctorBottomSheetState();
}

class _GetDoctorBottomSheetState extends State<GetDoctorBottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  // this for choice the color
  Color? choiceColor(String typeColor) {
    Color? color;
    switch (typeColor) {
      case 'red':
        color = DefaultColors.pink;
        break;
      case 'blue':
        color = DefaultColors.purple;
        break;
      case 'orange':
        color = DefaultColors.orange;
      case 'green':
        color = DefaultColors.lightTeal;
        break;
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.7,
      maxChildSize: 1,
      builder: (_, controller) => Container(
        color: Colors.white,
        child: Container(
          margin: const EdgeInsets.all(16),
          child: ListView(
            controller: controller,
            children: [
              AppBar(
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Image.asset('assets/down_arrow.png'),
                ),
              ),
              Column(
                children: [
                  // Using Wrap makes the height dynamic
                  Wrap(
                    children: [
                      // photo
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          imageUrl: widget.doctor.doctorPhoto,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => SizedBox(
                            height: 200.0,
                            width: 200.0,
                            child: Center(
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                                color: DefaultColors.pink,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // title for section
                      AutoSizeText(
                        widget.doctor.title,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // name
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Icon(Icons.account_circle),
                              AutoSizeText(
                                'In name : ${widget.doctor.doctorName}',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                          // time
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Icon(Icons.access_time),
                              AutoSizeText(
                                'Time : ${widget.doctor.timeClass}',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                          // date
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Icon(Icons.date_range),
                              AutoSizeText(
                                'In date : ${widget.doctor.dateClass}',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                          // place doctor
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Icon(Icons.map),
                              AutoSizeText(
                                'Place : ${widget.doctor.place}',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                          // medical specialty
                          FittedBox(
                            child: Chip(
                              elevation: 0,
                              shape: StadiumBorder(
                                  side: BorderSide(color: Colors.transparent)),
                              backgroundColor: choiceColor(
                                  widget.doctor.colorDoctorSpecialty),
                              label: Text(
                                widget.doctor.medicalSpecialty,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
