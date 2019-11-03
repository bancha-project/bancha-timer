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
        child: Text("3:00"),
      ),
    );
  }
}
