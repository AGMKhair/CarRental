import 'package:intl/intl.dart';

class DateTimeUtil {
  static String FORMATE_HYPHEN = '-';

  static String getCurrentDateWithDayName() {
    String dateFormat;
    DateTime date = DateTime.now();
    dateFormat = DateFormat('EEEE, d MMM, yyyy').format(date);
    return dateFormat;
  }

  static String getCurrentDate() {
    String dateFormat;
    DateTime date = DateTime.now();
    dateFormat = DateFormat('dd-MM-yyyy').format(date);
    return dateFormat;
  }

  static String getCurrentTime() {
    String dateFormat;
    DateTime date = DateTime.now();
    dateFormat = DateFormat('hh:mm a').format(date);
    return dateFormat;
  }

  static String getCurrentDateTime() {
    String dateFormat;
    DateTime date = DateTime.now();
    dateFormat = DateFormat('dd-MM-yyyy hh:mm a').format(date);
    return dateFormat;
  }
}
