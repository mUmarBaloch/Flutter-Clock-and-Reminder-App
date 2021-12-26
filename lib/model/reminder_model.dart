import 'package:flutter/cupertino.dart';

class Reminder {
  final int? id;
  final int? minutes;
  final String? title;

  Reminder({required this.id, required this.minutes, this.title});

  Reminder.fromMap(Map map)
      : this.id = map['id'],
        this.minutes = map['minutes'],
        this.title = map['title'] ?? '';

  toMap() =>
      {'id': this.id, 'minutes': this.minutes, 'title': this.title ?? ''};
}
