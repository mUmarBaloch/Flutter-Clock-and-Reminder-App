import 'package:clock_app/model/reminder_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

class AddReminder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Dialog(
      child: Container(
        height: 200,
        width: 200,
        child: Column(
          children: [
            Text('reminders only consist minutes'),
            TextField(
              controller: controller,
              decoration: InputDecoration(hintText: 'input only numbers'),
            ),
            IconButton(
                onPressed: () {
                  Provider.of<ReminderController>(context, listen: false)
                      .addReminders(
                          id: ReminderController().reminders.length,
                          minutes: int.parse(controller.text));
                  // await FlutterLocalNotificationsPlugin().schedule(
                  //     ReminderController().reminders.length,
                  //     'reminder',
                  //     '${controller.text} minutes reminder',
                  //     DateTime.now()
                  //         .add(Duration(minutes: int.parse(controller.text))),
                  //     notificationDetails);
                  Navigator.pop(context);
                },
                icon: Icon(Icons.send)),
          ],
        ),
      ),
    );
  }
}
