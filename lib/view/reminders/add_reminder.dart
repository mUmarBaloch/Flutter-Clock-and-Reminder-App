import 'package:clock_app/controller/local_db.dart';
import 'package:clock_app/controller/reminder_controller.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddReminder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    List<int> numbers = List.generate(61, (n) {
      if (n > 0) {
        return n;
      }
      return 60;
    });
    int val = 1;
    return Dialog(
      child: Container(
        color: Colors.blue[800],
        height: 300,
        width: 200,
        child: Column(
          children: [
            TextField(
              controller: titleController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: '  title for reminder'),
            ),
            SizedBox(
              height: 10,
            ),
            Text('make the number on center, to select minutes',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                )),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListWheelScrollView(
                  onSelectedItemChanged: (index) {
                    val = index;
                    print(val);
                  },
                  itemExtent: 100,
                  children: numbers
                      .map((e) => Container(
                            height: 70,
                            width: 100,
                            color: Colors.blue[500],
                            child: Center(
                              child: Text(
                                '$e',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ))
                      .toList()),
            ),
            IconButton(
                color: Colors.white,
                onPressed: () {
                  Provider.of<ReminderController>(context, listen: false)
                      .addReminders(
                          id: ReminderController().reminders.length,
                          minutes: val,
                          title: titleController.text.length < 2
                              ? 'Reminde me after '
                              : titleController.text);
                  LocalDb().addData();

                  Navigator.pop(context);
                },
                icon: Icon(Icons.send)),
          ],
        ),
      ),
    );
  }
}
