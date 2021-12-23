import 'package:flutter/material.dart';

Container reminderCard({@required int? id, @required int? minutes}) {
  return Container(
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient:
          LinearGradient(colors: [Colors.deepPurple, Colors.deepPurpleAccent]),
    ),
    child: ListTile(
      title: Text(
        'Remind me after :',
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text('$minutes minutes', style: TextStyle(color: Colors.white)),
      onTap: null,
    ),
  );
}
