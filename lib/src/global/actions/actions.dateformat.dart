import 'package:flutter/material.dart';

String formatDate({
  required DateTime time,
  bool dateOnly = false,
  bool timeOnly = false,
}) {
  String year = time.year.toString();

  // Add "0" on the left if month is from 1 to 9
  String month = time.month.toString().padLeft(2, '0');

  // Add "0" on the left if day is from 1 to 9
  String day = time.day.toString().padLeft(2, '0');

  // Add "0" on the left if hour is from 1 to 9
  String hour = time.hour.toString().padLeft(2, '0');

  // Add "0" on the left if minute is from 1 to 9
  String minute = time.minute.toString().padLeft(2, '0');

  // Add "0" on the left if second is from 1 to 9
  String second = time.second.toString();

  // If you only want year, month, and date
  if (timeOnly == true) {
    return "$hour:$minute";
  }
  if (dateOnly == false) {
    return "$day/$month/$year $hour:$minute:$second";
  }

  // return the "yyyy-MM-dd HH:mm:ss" format
  return "$day/$month/$year";
}

String formatTime({required TimeOfDay time, bool dateOnly = false}) {
  String hour = time.hour.toString().padLeft(2, '0');
  String minutes = time.minute.toString().padLeft(2, '0');

  return "$hour:$minutes";
}
