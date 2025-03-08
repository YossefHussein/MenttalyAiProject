// ignore_for_file: slash_for_doc_comments

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/mode_message/mode_message_bloc.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/mode_message/mode_message_state.dart';
import 'package:mental_health_app/features/presentation/meditation/data/chart_mode/data_helper.dart';
import 'package:mental_health_app/features/presentation/meditation/data/model/chart_mode_data_model.dart';
import 'package:mental_health_app/features/presentation/meditation/widgets/chart_widget.dart';
import 'dart:math';
import 'package:mental_health_app/features/presentation/meditation/widgets/feeling_button.dart';
import 'package:mental_health_app/translations/locale_keys.dart';

/**
 * recording the mode of user
 */

/// mode bottom sheet
void customMoodBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    enableDrag: false,
    // isDismissible: false,
    // This allows the sheet to take up more space if needed
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return CustomBottomSheet();
    },
  );
}

final chartKey = GlobalKey<ChartState>();
List<ChartModeDataModel> salesData = <ChartModeDataModel>[];

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _SongsBottomSheetState();
}

class _SongsBottomSheetState extends State<CustomBottomSheet> {
  late DataBaseHelper dbHelper;
  late int count;
  late ChartModeDataModel data;

  @override
  void initState() {
    super.initState();
    count = 1;
    dbHelper = DataBaseHelper.instance;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.7,
      maxChildSize: 1,
      builder: (_, controller) =>
          BlocBuilder<MoodMessageBloc, MoodMessageState>(
        builder: (context, state) {
          return Container(
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.all(16),
              child: ListView(
                controller: controller,
                children: [
                  Container(
                    height: 400,
                    child: ChartWidget(
                      key: chartKey,
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     dbHelper.add(
                  //         SalesData(xValue: count, yValue: getRandomInt(10, 20)));
                  //     salesData = await dbHelper.getSales();
                  //     chartKey.currentState!.setState(
                  //       () {},
                  //     );
                  //     count++;
                  //   },
                  //   child: Text('Add'),
                  // ),
                  Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    // spacing: 16,
                    children: [
                      FeelingButton(
                          label: LocaleKeys.home_screen_happy_mood_button.tr(),
                          image: 'assets/happy.png',
                          color: DefaultColors.pink,
                          onTap: () async {
                            dbHelper.add(
                              ChartModeDataModel(
                                happyXValueNum: count,
                                happyYValueNum: getRandomInt(10, 20),
                              ),
                            );
                            salesData = await dbHelper.getDatabase();
                            chartKey.currentState!.setState(
                              () {},
                            );
                            count++;
                          }),
                      FeelingButton(
                          label: LocaleKeys.home_screen_calm_mood_button.tr(),
                          image: 'assets/calm.png',
                          color: DefaultColors.purple,
                          onTap: () async {
                            dbHelper.add(
                              ChartModeDataModel(
                                calmXValueNum: count,
                                clamYValueNum: getRandomInt(10, 20),
                              ),
                            );
                            salesData = await dbHelper.getDatabase();
                            chartKey.currentState!.setState(
                              () {},
                            );
                            count++;
                          }),
                      FeelingButton(
                          label: LocaleKeys.home_screen_relax_mood_button.tr(),
                          image: 'assets/relax.png',
                          color: DefaultColors.orange,
                          onTap: () async {
                            dbHelper.add(
                              ChartModeDataModel(
                                relaxXValueNum: count,
                                relaxYValueNum: getRandomInt(10, 20),
                              ),
                            );
                            salesData = await dbHelper.getDatabase();
                            chartKey.currentState!.setState(
                              () {},
                            );
                            count++;
                          }),
                      FeelingButton(
                          label: LocaleKeys.home_screen_focus_mood_button.tr(),
                          image: 'assets/focus.png',
                          color: DefaultColors.lightTeal,
                          onTap: () async {
                            dbHelper.add(
                              ChartModeDataModel(
                                focusXValueNum: count,
                                focusYValueNum: getRandomInt(10, 20),
                              ),
                            );
                            salesData = await dbHelper.getDatabase();
                            chartKey.currentState!.setState(
                              () {},
                            );
                            count++;
                          }),
                    ],
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async {
                      salesData = await dbHelper.getDatabase();
                      if (salesData.isNotEmpty) {
                        data = salesData.last;
                        dbHelper.delete();
                        salesData = await dbHelper.getDatabase();
                        chartKey.currentState!.setState(
                          () {},
                        );
                        count--;
                      }
                    },
                    child: Text('Clear'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  int getRandomInt(int min, int max) {
    final Random random = Random();
    return min + random.nextInt(max - min);
  }
}
