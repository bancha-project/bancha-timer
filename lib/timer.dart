import 'package:flutter/material.dart';

class Timer extends StatefulWidget {

  @override
  TimerState createState() => TimerState();
}

class TimerState extends State<Timer> {
  Duration remainingTime = Duration(hours: 0, minutes: 3, seconds: 0);

  @override
  Widget build(BuildContext context) {
    return Text(_formatDuration(remainingTime));
  }

  String _formatDuration(Duration duration) {
    return duration.toString().split(".")[0];
  }
}
