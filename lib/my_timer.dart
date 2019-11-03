import 'dart:async';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class MyTimer extends StatefulWidget {

  @override
  MyTimerState createState() => MyTimerState();
}

class MyTimerState extends State<MyTimer> {
  int _defaultHours = 0;
  int _defaultMinutes = 3;
  int _defaultSeconds = 0;
  Duration _defaultTime = Duration(hours: 0, minutes: 3, seconds: 0);

  Duration _remainingTime = Duration(hours: 0, minutes: 3, seconds: 0);
  Timer _timer = null;

  bool _isActive = false;

  AudioCache _player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 120),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    _formatDuration(_remainingTime),
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(' / '),
                Text(_formatDuration(_defaultTime))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IgnorePointer(
                  ignoring: _isActive,
                  child: FlatButton(
                    onPressed: _startTimer,
                    color: !_isActive ? Colors.blue : Colors.grey,
                    child: Text(
                      '開始',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                IgnorePointer(
                  ignoring: !_isActive,
                  child: FlatButton(
                    onPressed: _stopTimer,
                    color: _isActive? Colors.red : Colors.grey,
                    child: Text(
                      '停止',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),

                ),
                FlatButton(
                  onPressed: _resetTimer,
                  color: Colors.green,
                  child: Text(
                    'リセット',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      NumberPicker.integer(
                          initialValue: _defaultHours,
                          minValue: 0,
                          maxValue: 23,
                          onChanged: (value) => _setHours(value),
                          listViewWidth: 40
                      ),
                      Text("時間"),
                      NumberPicker.integer(
                          initialValue: _defaultMinutes,
                          minValue: 0,
                          maxValue: 59,
                          onChanged: (value) => _setMinutes(value),
                          listViewWidth: 50
                      ),
                      Text("分"),
                      NumberPicker.integer(
                          initialValue: _defaultSeconds,
                          minValue: 0,
                          maxValue: 23,
                          onChanged: (value) => _setSeconds(value),
                          listViewWidth: 50
                      ),
                      Text("秒"),
                    ],
                  ),
                ],
              )
            )
          ],
        )
    );
  }

  String _formatDuration(Duration duration) {
    return duration.toString().split(".")[0];
  }

  void _startTimer() {
    _player.play('game_swordwoman-greeting1.mp3');

    setState(() {
      _isActive = true;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime.inSeconds > 0) {
        setState(() {
          _remainingTime = new Duration(
            seconds: _remainingTime.inSeconds - 1,
          );
        });
      } else {
        _player.play('game_swordwoman-faint1.mp3');
        _timer.cancel();
        debugPrint('end of timer');
      }
    });
  }

  void _stopTimer() {
    setState(() {
      _isActive = false;
    });
    _timer.cancel();
  }

  void _resetTimer () {
    setState(() {
      if (_remainingTime.inSeconds <= 0) {
        _isActive = false;
      }

      _remainingTime = Duration(
          seconds: _defaultTime.inSeconds
      );
    });
  }

  void _setHours(int hours) {
    setState(() {
      _defaultHours = hours;
    });
    _setDefaultTime();
  }

  void _setMinutes(int minutes) {
    setState(() {
      _defaultMinutes = minutes;
    });
    _setDefaultTime();
  }

  void _setSeconds(int seconds) {
    setState(() {
      _defaultSeconds = seconds;
    });
    _setDefaultTime();
  }

  void _setDefaultTime() {
    setState(() {
      _defaultTime = Duration(
        hours: _defaultHours,
        minutes: _defaultMinutes,
        seconds: _defaultSeconds,
      );
    });
  }
}
