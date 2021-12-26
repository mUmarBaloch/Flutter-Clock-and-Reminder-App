import 'package:clock_app/controller/local_db.dart';
import 'package:clock_app/controller/reminder_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Container reminderCard(
    {required BuildContext context,
    required int id,
    required int minutes,
    String title = 'Remind me after :',
    isReminderScreen = true}) {
  return Container(
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient:
          LinearGradient(colors: [Colors.deepPurple, Colors.deepPurpleAccent]),
    ),
    child: ListTile(
      title: Text(
        '$title :',
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text('$minutes minutes', style: TextStyle(color: Colors.white)),
      onTap: null,
      trailing: isReminderScreen
          ? IconButton(
              onPressed: () async {
                Provider.of<ReminderController>(context, listen: false)
                    .deleteReminder(id);

                LocalDb().addData();
              },
              icon: Icon(Icons.delete))
          : null,
    ),
  );
}
