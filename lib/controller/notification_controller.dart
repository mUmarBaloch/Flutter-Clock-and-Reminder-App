import 'package:clock_app/controller/reminder_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

var _flutterLocalNotificationPlugin;
var _androidNotificationDetails;
var _notificationDetails;

class NotificationController {
  initNotification() async {
    _flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettings = InitializationSettings(android: androidInit);
    await _flutterLocalNotificationPlugin.initialize(initializationSettings);
  }

  AndroidNotificationDetails androidNotificationDetails(int id) {
    return AndroidNotificationDetails('$id', 'notifier',
        importance: Importance.max, priority: Priority.high, ticker: 'ticker');
  }

  addNotification(String title, int id) async {
    var _time = DateTime.now().add(Duration(seconds: int.parse(title)));
    // ignore: deprecated_member_use
    await FlutterLocalNotificationsPlugin().schedule(
        id,
        title,
        'reminder from umar baloch',
        _time,
        NotificationDetails(android: androidNotificationDetails(id)));
  }

  deleteNotification(int id) {
    FlutterLocalNotificationsPlugin().cancel(id);
  }
}
