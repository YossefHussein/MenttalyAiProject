import 'package:fluttertoast/fluttertoast.dart';
import 'package:mental_health_app/core/theme.dart';

Future<bool?> notPasswordMatch(message) async {
  return await Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 5,
    backgroundColor: DefaultColors.orange,
    textColor: DefaultColors.white,
    fontSize: 16.0,

  );
}