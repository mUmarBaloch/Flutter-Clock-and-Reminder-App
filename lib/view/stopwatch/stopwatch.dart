import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class Stopwatch extends StatelessWidget {
  final CountDownController controller = CountDownController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: NeonCircularTimer(
      width: 200,
      duration: 300,
      controller: controller,
      neonColor: Colors.deepPurpleAccent,
      innerFillColor: Colors.deepPurple,
      outerStrokeColor: Colors.white,
      textStyle: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w900,
        letterSpacing: 1.5,
      ),
    ));
  }
}
