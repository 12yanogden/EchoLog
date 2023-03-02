import 'package:echo_log/backend/emotion_service.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/emotion.dart';

class DateStamp extends StatelessWidget {
  final DateTime date;

  const DateStamp({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weekDay = findWeekDay(date);
    var month = findMonth(date);
    var monthDay = date.day.toString();
    var total = month + " " + monthDay;
    return Container(
      padding: EdgeInsets.all(2.0),
      width: 60, // standard width
      height: 60, // standard height
      decoration: BoxDecoration(
        color: Color.fromARGB(
            255, 77, 132, 89), // FIX THIS! NEEDS TO BE COLOR PALLET
        borderRadius: BorderRadius.circular(8.0),
      ),
      //color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(weekDay, style: TextStyle(fontSize: 20, color: Colors.white)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(total, style: TextStyle(color: Colors.white))],
          ),
        ],
      ),
    );
  }
}

String findMonth(DateTime date) {
  var month = "";
  if (date.month == 1) {
    month = "Jan";
  } else if (date.month == 2) {
    month = "Feb";
  } else if (date.month == 3) {
    month = "Mar";
  } else if (date.month == 4) {
    month = "Apr";
  } else if (date.month == 5) {
    month = "May";
  } else if (date.month == 6) {
    month = "June";
  } else if (date.month == 7) {
    month = "July";
  } else if (date.month == 8) {
    month = "Aug";
  } else if (date.month == 9) {
    month = "Sep";
  } else if (date.month == 10) {
    month = "Oct";
  } else if (date.month == 11) {
    month = "Nov";
  } else if (date.month == 12) {
    month = "Dec";
  } else {
    month = "ERROR";
  }
  return month;
}

String findWeekDay(DateTime date) {
  var weekDay = "";
  if (date.weekday == 1) {
    weekDay = "MON";
  } else if (date.weekday == 2) {
    weekDay = "TUE";
  } else if (date.weekday == 3) {
    weekDay = "WED";
  } else if (date.weekday == 4) {
    weekDay = "THU";
  } else if (date.weekday == 5) {
    weekDay = "FRI";
  } else if (date.weekday == 6) {
    weekDay = "SAT";
  } else if (date.weekday == 7) {
    weekDay = "SUN";
  } else {
    weekDay = "ERROR";
  }
  return weekDay;
}