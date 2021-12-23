import 'package:flutter/cupertino.dart';

class Reminder {
  final int? id;
  final int? minutes;

  Reminder({required this.id, required this.minutes});

  Reminder.fromMap(Map map)
      : this.id = map['id'],
        this.minutes = map['minutes'];

  toMap() => {'id': this.id, 'minutes': this.minutes};
}
