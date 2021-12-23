import 'package:flutter/cupertino.dart';

class Reminder {
  final int? id;
  final int? minutes;

  Reminder({required this.id, required this.minutes});
}

List<Reminder> _reminders = [];

class ReminderController extends ChangeNotifier {
  List<Reminder> get reminders => _reminders;
  void addReminders({required int id, required int minutes}) {
    _reminders.add(Reminder(id: id, minutes: minutes));
    notifyListeners();
  }
}
