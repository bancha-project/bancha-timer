import 'dart:async';

import 'package:flutter/material.dart';

class MyTimer extends StatefulWidget {

  @override
  MyTimerState createState() => MyTimerState();
}

class MyTimerState extends State<MyTimer> {
  Duration _remainingTime = Duration(hours: 0, minutes: 3, seconds: 0);
  Timer _timer = null;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            Text(_formatDuration(_remainingTime)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: _startTimer,
                  color: Colors.blue,
                  child: Text(
                    '開始',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: _stopTimer,
                  color: Colors.red,
                  child: Text(
                    '停止',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        )
    );
  }

  String _formatDuration(Duration duration) {
    return duration.toString().split(".")[0];
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _remainingTime = new Duration(
          seconds: _remainingTime.inSeconds - 1,
        );
      });
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }
}
