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

  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
        enable: true,
        // Display mode of trackball tooltip
        tooltipDisplayMode: TrackballDisplayMode.floatAllPoints
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(text: 'Line Chart'),
      trackballBehavior: _trackballBehavior,
      series: <SplineSeries<ChartModeDataModel, num>>[
        SplineSeries<ChartModeDataModel, num>(
          animationDuration: 1,
          dataSource: chartModeData,
          color: DefaultColors.pink,
          xValueMapper: (ChartModeDataModel sales, _) => sales.happyXValueNum,
          yValueMapper: (ChartModeDataModel sales, _) => sales.happyYValueNum,
          name: 'happy',
        ),
        SplineSeries<ChartModeDataModel, num>(
          animationDuration: 1,
          dataSource: chartModeData,
          color: DefaultColors.purple,
          xValueMapper: (ChartModeDataModel sales, _) => sales.calmXValueNum,
          yValueMapper: (ChartModeDataModel sales, _) => sales.clamYValueNum,
          name: 'clam',
        ),
        SplineSeries<ChartModeDataModel, num>(
          animationDuration: 1,
          dataSource: chartModeData,
          color: DefaultColors.orange,
          xValueMapper: (ChartModeDataModel sales, _) => sales.relaxXValueNum,
          yValueMapper: (ChartModeDataModel sales, _) => sales.relaxYValueNum,
          name: 'relax',
        ),
        SplineSeries<ChartModeDataModel, num>(
          animationDuration: 1,
          dataSource: chartModeData,
          color: DefaultColors.lightTeal,
          xValueMapper: (ChartModeDataModel sales, _) => sales.focusXValueNum,
          yValueMapper: (ChartModeDataModel sales, _) => sales.focusYValueNum,
          name: 'focus',
        ),
      ],
    );
  }
}

class ChartBubble extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ChartBubble({super.key});

  @override
  State<ChartBubble> createState() => _ChartBubbleState();
}

class _ChartBubbleState extends State<ChartBubble> {
  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
        enable: true,
        // Display mode of trackball tooltip
        tooltipDisplayMode: TrackballDisplayMode.floatAllPoints
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
        trackballBehavior: _trackballBehavior,
        title: ChartTitle(text: 'Bubble Chart'),
        series: <CartesianSeries<ChartModeDataModel, num>>[
          BubbleSeries<ChartModeDataModel, num>(
            dataSource: chartModeData,
            color: DefaultColors.pink,
            xValueMapper: (ChartModeDataModel sales, _) => sales.happyXValueNum,
            yValueMapper: (ChartModeDataModel sales, _) => sales.happyYValueNum,
            name: 'Happy',
          ),
          BubbleSeries<ChartModeDataModel, num>(
            animationDuration: 1,
            dataSource: chartModeData,
            color: DefaultColors.purple,
            xValueMapper: (ChartModeDataModel sales, _) => sales.calmXValueNum,
            yValueMapper: (ChartModeDataModel sales, _) => sales.clamYValueNum,
            name: 'clam',
          ),
          BubbleSeries<ChartModeDataModel, num>(
            animationDuration: 1,
            dataSource: chartModeData,
            color: DefaultColors.orange,
            xValueMapper: (ChartModeDataModel sales, _) => sales.relaxXValueNum,
            yValueMapper: (ChartModeDataModel sales, _) => sales.relaxYValueNum,
            name: 'relax',
          ),
          BubbleSeries<ChartModeDataModel, num>(
            animationDuration: 1,
            dataSource: chartModeData,
            color: DefaultColors.lightTeal,
            xValueMapper: (ChartModeDataModel sales, _) => sales.focusXValueNum,
            yValueMapper: (ChartModeDataModel sales, _) => sales.focusYValueNum,
            name: 'focus',
          ),
        ]);
  }
}
