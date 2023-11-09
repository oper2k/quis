import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool emailValidation(String? email) {
  // check if string is email
  if (email == null || email.isEmpty) {
    return false;
  }
  final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return regex.hasMatch(email);
}

bool passwordValidation(String? password) {
  // check if password valid (8-14 symbols)
  if (password == null || password.isEmpty) {
    return false;
  }
  return password.length >= 8 && password.length <= 14;
}

String generateRefCode() {
  // generate a random 6 symbols code with digits and capital letters
  final random = math.Random();
  final chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final code = List.generate(6, (index) => chars[random.nextInt(chars.length)]);
  return code.join();
}

int? findUserIndexFromList(
  List<UsersRecord> userList,
  String userID,
) {
  // find user index in userList.
  for (int i = 0; i < userList.length; i++) {
    if (userList[i].uid == userID) {
      return i;
    }
  }
  return null;
}

bool customSearching(
  String? searchingStr,
  String? string,
) {
  if (searchingStr == null || string == null) {
    return false;
  }
  return string.toLowerCase().contains(searchingStr.toLowerCase());
}

String? styleHTMLfunc(String? text) {
  if (text == null) {
    return null;
  }

  String cssStyle = '''
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap');
        body {
            font-family: 'Inter';

            font-size: 14px;
            font-style: normal;
            font-weight: 400;
            line-height: 150%; /* 21px */
            letter-spacing: -0.408px;
        }
        h1{
            font-size: 24px;
            font-style: normal;
            font-weight: 600;
            line-height: 140%; /* 33.6px */
        }
        h4 {
            font-style: normal;
            font-weight: 600;
            line-height: 18px; /* 128.571% */
        }
        hr {
            margin: 1em 0;
            border: 0;
            height: 1px;
            background-color: #DFE5EA;
        }
    </style>
  ''';

  return '<html>$cssStyle <body>$text</body></html>';
}

int videoIndexInList(
  DocumentReference videoRef,
  List<CourseVideoRecord> videoList,
) {
  // find Index of the video in the list
  for (int i = 0; i < videoList.length; i++) {
    if (videoList[i].reference == videoRef) {
      return i;
    }
  }
  return -1;
}

List<String> generateExpYears(int itemsNumber) {
  // generate list of strings (digits)
  return List.generate(itemsNumber + 1, (index) => index.toString());
}

DateTime dateTimeToDate(DateTime dateTime) {
  // date time to date
  return DateTime(dateTime.year, dateTime.month, dateTime.day);
}

DateTime? getSameTime(
  int unixTimeInt,
  DateTime userTime,
) {
  DateTime unixTime = DateTime.fromMillisecondsSinceEpoch(unixTimeInt * 1000);

  int hour = unixTime.hour;
  int minute = unixTime.minute;

  DateTime DisTime =
      DateTime(userTime.year, userTime.month, userTime.day, hour, minute);

  return userTime.isAfter(DisTime) ? DisTime.add(Duration(days: 1)) : DisTime;
}

DateTime timeMinusMinutes(
  DateTime dateTime,
  String? minutes,
) {
  // dateTime minus minutes
  if (minutes == null) {
    return dateTime;
  }
  final int minutesInt = int.tryParse(minutes) ?? 0;
  return dateTime.subtract(Duration(minutes: minutesInt));
}

int subtractTime(
  DateTime time1,
  DateTime time2,
) {
  return time1.millisecondsSinceEpoch - time2.millisecondsSinceEpoch;
}

List<DateTime>? generateCalendar(DateTime? pickedMonth) {
  if (pickedMonth == null) {
    pickedMonth = DateTime.now();
  }

  int year = pickedMonth!.year;
  int month = pickedMonth!.month;
  DateTime thisMonth = DateTime(year, month, 0);
  DateTime nextMonth = DateTime(year, month + 1, 0);
  int numberDays = nextMonth.difference(thisMonth).inDays;

  final items = List<DateTime>.generate(numberDays,
      (i) => DateTime(pickedMonth!.year, pickedMonth!.month, i + 1));

  int weekday = items[0].weekday;
  for (int a = 0; a < (weekday - 1); a++) {
    items.insert(a, DateTime(0, 0, 0));
  }

  return items;
}

DateTime decMonth(DateTime date) {
  return DateTime(date.year, date.month - 1, date.day);
}

DateTime incMonth(DateTime date) {
  return DateTime(date.year, date.month + 1, date.day);
}
