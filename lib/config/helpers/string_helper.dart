import 'package:intl/intl.dart';

class StringHelper {
  static String elipsis(String string, int n) {
    return string.length <= n ? string : "${string.substring(0, n)}...";
  }

  static String formatDateTime(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDateTime = DateFormat('EEEE, h a').format(dateTime);
    return formattedDateTime.substring(0, 1).toUpperCase() +
        formattedDateTime.substring(1).toLowerCase();
  }

  static String getHour(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String hour = DateFormat('h a').format(dateTime).toLowerCase();
    return hour;
  }

  static String getDayOfWeek(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String dayOfWeek = DateFormat('EEEE').format(dateTime);
    return dayOfWeek;
  }
}
