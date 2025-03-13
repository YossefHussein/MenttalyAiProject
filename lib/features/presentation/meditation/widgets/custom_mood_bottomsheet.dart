// ignore_for_file: slash_for_doc_comments

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mental_health_app/core/routes.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/auth_screens/widgets/widgets.dart';
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

final GlobalKey<ChartState> chartKey = GlobalKey<ChartState>();
List<ChartModeDataModel> chartModeData = <ChartModeDataModel>[];

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
                  Container(
                    height: 400,
                    child: ChartBubble(
                      key: chartKey,
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async {
                      chartModeData = await dbHelper.getDatabase();
                      if (chartModeData.isNotEmpty) {
                        data = chartModeData.last;
                        dbHelper.delete();
                        chartModeData = await dbHelper.getDatabase();
                        chartKey.currentState?.setState(
                          () {},
                        );
                        count--;
                      }
                      context.pop();
                      sendMSG('Clear process is done');
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
