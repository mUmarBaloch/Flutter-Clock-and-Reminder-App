// @dart=2.9

import 'package:clock_app/view/reminders/reminder.dart';
import 'package:clock_app/view/stopwatch/stopwatch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'view/home/home.dart';

var flutterLocalNotificationPlugin;
var androidNotificationDetails;
var notificationDetails;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();
  const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
  androidNotificationDetails = AndroidNotificationDetails('1', 'notify',
      importance: Importance.max, priority: Priority.high, ticker: 'ticker');
  notificationDetails =
      NotificationDetails(android: androidNotificationDetails);
  const initializationSettings = InitializationSettings(android: androidInit);
  await flutterLocalNotificationPlugin.initialize(initializationSettings);
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
      theme: ThemeData(primaryColor: Colors.deepPurpleAccent,
      primarySwatch: Colors.deepPurple),
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(child: screens[index]),
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
