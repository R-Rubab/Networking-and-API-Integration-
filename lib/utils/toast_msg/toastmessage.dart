
import '../export_files/export.dart';

class Utils {
 static toastMessage(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.indigo,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
