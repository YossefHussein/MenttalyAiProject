import 'package:flutter/material.dart';

class ChartModeDataModel {
  //SQLite table name.
  static const tblMode = 'chartModeTable';

  /// x and y columns of the table.
  // happy
  static const happyXValue = 'happyXValue';
  static const happyYValue = 'happyYValue';

  // calm
  static const calmXValue = 'clamXValue';
  static const clamYValue = 'clamYValue';

  // relax
  static const relaxXValue = 'relaxXValue';
  static const relaxYValue = 'relaxYValue';

  // focus
  static const focusXValue = 'focusXValue';
  static const focusYValue = 'focusYValue';

  ChartModeDataModel({
    this.happyXValueNum,
    this.happyYValueNum,
    this.calmXValueNum,
    this.clamYValueNum,
    this.relaxXValueNum,
    this.relaxYValueNum,
    this.focusXValueNum,
    this.focusYValueNum,
  });

  // for make color in pie chart
  static const Color pink = Color(0xFFEA2B83);
  static const Color purple = Color(0xFF8E8FF8);
  static const Color orange = Color(0xFFF18F3B);
  static const Color lightTeal = Color(0xFF58D5D4);

  // data
  num? happyXValueNum;
  num? happyYValueNum;

  num? calmXValueNum;
  num? clamYValueNum;

  num? relaxXValueNum;
  num? relaxYValueNum;

  num? focusXValueNum;
  num? focusYValueNum;

  ChartModeDataModel.fromMap(Map<String, dynamic> map) {
    happyXValueNum = map[happyXValue];
    happyYValueNum = map[happyYValue];

    calmXValueNum = map[calmXValue];
    clamYValueNum = map[clamYValue];

    relaxXValueNum = map[relaxXValue];
    relaxYValueNum = map[relaxYValue];

    focusXValueNum = map[focusXValue];
    focusYValueNum = map[focusYValue];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      // happy
      happyXValue: happyXValueNum,
      happyYValue: happyYValueNum,
      // clam
      calmXValue: calmXValueNum,
      clamYValue: clamYValueNum,
      // relax
      relaxXValue: relaxXValueNum,
      relaxYValue: relaxYValueNum,
      // focus
      focusXValue: focusXValueNum,
      focusYValue: focusYValueNum,
    };
    return map;
  }
}
