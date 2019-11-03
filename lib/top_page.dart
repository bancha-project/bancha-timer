import 'package:bancha_timer/my_timer.dart';
import 'package:flutter/material.dart';

class TopPage extends StatelessWidget {
  TopPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(title)
      ),
      body: Center(
        child: MyTimer()
      ),
    );
  }
}
