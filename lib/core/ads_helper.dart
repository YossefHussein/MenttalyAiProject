import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3541561665141480/1576506826';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3541561665141480/9690779451';
    } else {
      throw UnsupportedError('Unsupported platform for banner ads');
    }
  }
}
