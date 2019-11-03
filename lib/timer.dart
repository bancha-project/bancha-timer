import 'package:flutter/material.dart';

class Timer extends StatefulWidget {

  @override
  TimerState createState() => TimerState();
}

class TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    return Text("3:00");
  }
}
