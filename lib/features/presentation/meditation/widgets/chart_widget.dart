import 'package:flutter/material.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/meditation/data/model/chart_mode_data_model.dart';
import 'package:mental_health_app/features/presentation/meditation/widgets/custom_mood_bottomsheet.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({Key? key}) : super(key: key);
  @override
  ChartState createState() => ChartState();
}

class ChartState extends State<ChartWidget> {
  ChartState({Key? key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      // primaryXAxis: DateTimeAxis(),
      series: <SplineSeries<ChartModeDataModel, num>>[
        SplineSeries<ChartModeDataModel, num>(
          animationDuration: 1,
          dataSource: salesData,
          color: DefaultColors.pink,
          xValueMapper: (ChartModeDataModel sales, _) => sales.happyXValueNum,
          yValueMapper: (ChartModeDataModel sales, _) => sales.happyYValueNum,
          name: 'happy',
        ),
        SplineSeries<ChartModeDataModel, num>(
          animationDuration: 1,
          dataSource: salesData,
          color: DefaultColors.purple,
          xValueMapper: (ChartModeDataModel sales, _) => sales.calmXValueNum,
          yValueMapper: (ChartModeDataModel sales, _) => sales.clamYValueNum,
          name: 'clam',
        ),
        SplineSeries<ChartModeDataModel, num>(
          animationDuration: 1,
          dataSource: salesData,
          color: DefaultColors.orange,
          xValueMapper: (ChartModeDataModel sales, _) => sales.relaxXValueNum,
          yValueMapper: (ChartModeDataModel sales, _) => sales.relaxYValueNum,
          name: 'relax',
        ),
        SplineSeries<ChartModeDataModel, num>(
          animationDuration: 1,
          dataSource: salesData,
          color: DefaultColors.lightTeal,
          xValueMapper: (ChartModeDataModel sales, _) => sales.focusXValueNum,
          yValueMapper: (ChartModeDataModel sales, _) => sales.focusYValueNum,
          name: 'focus',
        ),
      ],
    );
  }
}
