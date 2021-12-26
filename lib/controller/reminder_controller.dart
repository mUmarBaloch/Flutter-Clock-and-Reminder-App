import 'dart:async';
import 'dart:isolate';

import 'package:clock_app/controller/local_db.dart';
import 'package:clock_app/controller/notification_controller.dart';
import 'package:clock_app/model/reminder_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

List<Reminder> _reminders = [];

class ReminderController extends ChangeNotifier {
  List<Reminder> get reminders => _reminders;
  void setReminders(List<Reminder> reminders) {
    _reminders = reminders;
    notifyListeners();
  }

  void deleteReminder(id) {
    NotificationController().deleteNotification(id);
    if (reminders.length > 1) {
      _reminders.removeAt(id);
    } else {
      _reminders.clear();
    }
    LocalDb().addData();
    notifyListeners();
  }

  void deleteAllReminder() {
    _reminders.clear();
    LocalDb().addData();
    notifyListeners();
  }

  void addReminders({required int id, required int minutes, String? title}) {
    NotificationController().addNotification(minutes, id, title);
    _reminders.add(Reminder(id: id, minutes: minutes, title: title));
    notifyListeners();
  }

  bgDeleteLogics() async {
    await Future.delayed(Duration(seconds: 2)).then((value) async {
      print('started delete after delievered method');
      await FlutterLocalNotificationsPlugin()
          .pendingNotificationRequests()
          .then((value) {
        print(value);
        if (reminders.length > 0 && value.length > 0) {
          for (int i = 0; i < reminders.length; i++) {
            print('first loop');
            for (int j = 0; j <= i; j++) {
              print('second loop');
              if (reminders[i].id != value[j].id) {
                print('not same');
                deleteReminder(i);
              }
            }
          }
        } else if (value.length < 1) {
          print('deleting all');
          deleteAllReminder();
          notifyListeners();
        }
      });
    });
    bgDeleteLogics();
  }

  deleteAfterDelievered() async {
    bgDeleteLogics();
  }
}
