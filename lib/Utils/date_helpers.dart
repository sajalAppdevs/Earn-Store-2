import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateHelpers {
  static String formatDate(String inputDate) {
    final dateTime = DateTime.parse(inputDate);
    final formatter = DateFormat('EEE, dd MMM yyyy');
    return formatter.format(dateTime);
  }

  static Future<String> selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      final formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
      return formattedDate;
    }
    return "";
  }
}
