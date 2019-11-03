import 'package:flutter/material.dart';

class Timer extends StatefulWidget {

  @override
  TimerState createState() => TimerState();
}

class TimerState extends State<Timer> {
  Duration remainingTime = Duration(hours: 0, minutes: 3, seconds: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
          Text(_formatDuration(remainingTime)),
          FlatButton(
            onPressed: _startTimer,
            color: Colors.blue,
            child: Text(
              '開始',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      )
    );
  }

  String _formatDuration(Duration duration) {
    return duration.toString().split(".")[0];
  }

  void _startTimer() {

  }
}
