import 'dart:convert';

import 'package:clock_app/controller/reminder_controller.dart';
import 'package:clock_app/model/reminder_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences _db;

class LocalDb {
  initDb() async {
    _db = await SharedPreferences.getInstance();
  }

  addData() async {
    var data = ReminderController().reminders;
    List<String> parser =
        data.map((reminder) => json.encode(reminder.toMap())).toList();
    await _db.setStringList('data', parser);
  }

  loadData() async {
    var data = await _db.getStringList('data');
    var parser = data!.map((e) => Reminder.fromMap(jsonDecode(e))).toList();
    ReminderController().setReminders(parser);
  }
}
