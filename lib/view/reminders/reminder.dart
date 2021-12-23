// @dart=2.9
import 'package:clock_app/model/reminder_model.dart';
import 'package:clock_app/view/reminders/add_reminder.dart';
import 'package:clock_app/view/reminders/reminder_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class Reminders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReminderController>(
      create: (context) => ReminderController(),
      child: Container(
        child: Consumer<ReminderController>(
          builder: (context, data, child) => ListView(
            children: [
              ...data.reminders.map((reminder) =>
                  reminderCard(id: reminder.id, minutes: reminder.minutes)),
              Container(
                padding: EdgeInsets.all(12),
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (_) =>
                          ChangeNotifierProvider<ReminderController>.value(
                              value: Provider.of<ReminderController>(context),
                              child: AddReminder())),
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
