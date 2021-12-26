import 'package:clock_app/controller/reminder_controller.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

var _flutterLocalNotificationPlugin;

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

  addNotification(int minutes, int id, [String? title]) async {
    var _time = DateTime.now().add(Duration(minutes: minutes));
    // ignore: deprecated_member_use

    await FlutterLocalNotificationsPlugin().schedule(
        id,
        '$minutes',
        title ?? 'Reminder by Umar baloch',
        _time,
        NotificationDetails(android: androidNotificationDetails(id)));
  }

  deleteNotification(int id) async {
    FlutterLocalNotificationsPlugin().cancel(id);
  }
}
