// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:awesome_notifications/awesome_notifications.dart';

Future awesomeNotificationSchedule(
//Как работают запланированные пуши?
// 1 - необходимо передать айди, это уникальный номер пуша.
// 2 - передать Тему и Сообщение пуша
// 3 - Если передать turnedOn - true то пуш включится, если передать false то выключится. Важно метчить их по id
// 4 - Пуш работает так, что ищет совпадение у себя в настройках с текущем временем/датой.
// те если мы хотим чтоб он приходил каждый денть в 15:00 то передаем Hour - 15, Minute - 00
// если хотим в 15:00 только по средам добавляем параметр weekday - 3

    int id, //Айди нотификации, обязательно
    String title, //Тема нотификации (это видит юзер), обязательно
    String message, //Сообщение нотификации (это видит юзер), обязательно
    int? hour, //Час когда придет нотификация, 0-23, не обязательно
    int? minute, //Минуты когда придет нотификация, 0-59, не обязательно
    int? year, //Год когда придет нотификация, 0-99999, не обязательно
    int? month, //Месяц когда придет нотификация, 1-12, не обязательно
    int? day, //День когда придет нотификация, 1-31, не обязательно
    int? weekday, //День недели когда придет нотификация, 1-7, не обязательно
    int?
        weekOfMonth, //Неделя месяца когда придет нотификация, 1-6, не обязательно
    int?
        weekOfYear, //Неделя года когда придет нотификация, 1-53, не обязательно
    bool repeats, //Повторение пуша
    bool turnedOn //Добавление или удаление пуша
    ) async {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'tap_in_notification',
        channelName: 'TapIn Notification',
        channelDescription: 'tap_in',
        importance: NotificationImportance.High,
        channelShowBadge: false,
        locked: false,
      ),
    ],
  );
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });

  String localTimeZone =
      await AwesomeNotifications().getLocalTimeZoneIdentifier();

  if (turnedOn == true) {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: 'tap_in_notification',
            title: title,
            body: message),
        schedule: NotificationCalendar(
            hour: hour,
            year: year,
            month: month,
            day: day,
            weekday: weekday,
            weekOfMonth: weekOfMonth,
            weekOfYear: weekOfYear,
            minute: minute,
            second: 00,
            timeZone: localTimeZone,
            preciseAlarm: true,
            repeats: repeats));
  }
  if (turnedOn == false) {
    await AwesomeNotifications().cancel(id);
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
