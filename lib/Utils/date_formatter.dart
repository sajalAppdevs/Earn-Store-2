import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(String inputDate) {
    final dateTime = DateTime.parse(inputDate);
    final formatter = DateFormat('EEE MMM yyyy');
    return formatter.format(dateTime);
  }
}
