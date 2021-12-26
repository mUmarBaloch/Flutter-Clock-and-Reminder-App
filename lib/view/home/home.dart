// @dart=2.9
import 'package:clock_app/controller/reminder_controller.dart';
import 'package:clock_app/view/reminders/reminder_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_widgets.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ReminderController>(context, listen: false)
        .deleteAfterDelievered();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Clock(),
        ),
        SizedBox(
          height: 10,
        ),
        Time(),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.deepPurple[300],
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Icon(
              Icons.alarm_on,
              color: Colors.deepPurpleAccent,
            ),
            Text('reminders', style: TextStyle(color: Colors.white))
          ],
        ),
        Consumer<ReminderController>(
          builder: (context, data, child) => Container(
              height: 220,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                  children: data.reminders.length > 0
                      ? [
                          reminderCard(
                              context: context,
                              title: data.reminders[0].title,
                              isReminderScreen: false,
                              id: data.reminders[0].id,
                              minutes: data.reminders[0].minutes),
                          if (data.reminders.length > 1)
                            reminderCard(
                                context: context,
                                title: data.reminders[1].title,
                                isReminderScreen: false,
                                id: data.reminders[1].id,
                                minutes: data.reminders[1].minutes),
                        ]
                      : [
                          SizedBox(
                            height: 100,
                          ),
                          Center(
                            child: Icon(
                              Icons.not_interested_rounded,
                              color: Colors.deepPurpleAccent,
                              size: 60,
                            ),
                          ),
                          Text('no reminders',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w100))
                        ])),
        )
      ],
    );
  }
}
