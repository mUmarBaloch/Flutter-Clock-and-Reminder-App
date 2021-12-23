// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:intl/intl.dart';

class Time extends StatelessWidget {
  const Time({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat.Hm().format(DateTime.now()),
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class Clock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: FlutterAnalogClock(),
    );
  }
}
