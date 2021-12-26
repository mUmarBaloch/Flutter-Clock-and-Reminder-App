// @dart=2.9

import 'package:clock_app/controller/local_db.dart';
import 'package:clock_app/controller/notification_controller.dart';
import 'package:clock_app/controller/reminder_controller.dart';
import 'package:clock_app/model/reminder_model.dart';
import 'package:clock_app/view/reminders/reminder.dart';
import 'package:clock_app/view/stopwatch/stopwatch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDb().initDb();
  await LocalDb().loadData();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> screens = [Home(), Stopwatch(), Reminders()];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.deepPurpleAccent,
          primarySwatch: Colors.deepPurple),
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: ChangeNotifierProvider<ReminderController>(
            create: (context) => ReminderController(),
            child: SafeArea(child: screens[index])),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.deepPurple,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.run_circle), label: 'stopwatch'),
            BottomNavigationBarItem(
                icon: Icon(Icons.alarm), label: 'reminders'),
          ],
        ),
      ),
    );
  }
}
