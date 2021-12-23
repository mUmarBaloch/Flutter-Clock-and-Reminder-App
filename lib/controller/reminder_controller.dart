import 'package:clock_app/controller/local_db.dart';
import 'package:clock_app/controller/notification_controller.dart';
import 'package:clock_app/model/reminder_model.dart';
import 'package:flutter/material.dart';

List<Reminder> _reminders = [];

class ReminderController extends ChangeNotifier {
  List<Reminder> get reminders => _reminders;
  void setReminders(List<Reminder> reminders) {
    _reminders = reminders;
    notifyListeners();
  }

  void deleteReminder(id) {
    NotificationController().deleteNotification(id);
    _reminders.removeAt(id);
    LocalDb().addData();
    notifyListeners();
  }

  void addReminders({required int id, required int minutes}) {
    NotificationController().addNotification('$minutes', id);
    _reminders.add(Reminder(id: id, minutes: minutes));
    notifyListeners();
  }
}
