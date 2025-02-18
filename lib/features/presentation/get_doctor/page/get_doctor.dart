import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/get_doctor/bloc/doctor_bloc.dart';
import 'package:mental_health_app/features/presentation/get_doctor/bloc/doctor_state.dart';

class GetDoctorScreen extends StatelessWidget {
  const GetDoctorScreen({super.key});

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
        break;
    }

    return color;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Get Doctor',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: DefaultColors.white,
        centerTitle: true,
        elevation: 0,
      ),
       body: BlocBuilder<GetDoctorBloc, GetDoctorState>(
        builder: (context, state) {
          if (state is GetDoctorLoading) {
            // display a loader
            return const LinearProgressIndicator(
              color: DefaultColors.pink,
            );
          } else if (state is GetDoctorLoaded) {
            // display all the information
            return 
            ListView.builder(
              itemCount: state.getDoctors.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          minRadius: 30,
                          maxRadius: 30,
                          backgroundImage: CachedNetworkImageProvider(
                            scale: 1,
                            state.getDoctors[index].doctorPhoto,
                          ),
                        ),
                        title: AutoSizeText(
                          state.getDoctors[index].title,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        subtitle: Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AutoSizeText(
                              state.getDoctors[index].doctorName,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: FontSizes.extraSmall),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            // FittedBox(
                            //   child: Chip(
                            //     elevation: 0,
                            //     shape: StadiumBorder(
                            //         side: BorderSide(color: Colors.transparent)),
                            //     backgroundColor: choiceColor(
                            //         state.getDoctors[index].colorDoctorSpecialty),
                            //     label: Text(
                            //       state.getDoctors[index].medicalSpecialty,
                            //       style: Theme.of(context)
                            //           .textTheme
                            //           .labelSmall
                            //           ?.copyWith(color: Colors.white),
                            //     ),
                            //   ),
                            // ), 
                          ],
                        ),
                        onTap: () {
                          // bottomSheet(
                          //   context,
                          //   songs: state.getDoctors[index],
                          // );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
        
          } else if (state is GetDoctorError) {
            // display an error
            return Center(
              child: AutoSizeText(
                state.message.toString(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            );
          } else {
            return Center(
              child: AutoSizeText(
                'No Songs Found',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            );
          }
        },
      ),
  
    );
  }
}