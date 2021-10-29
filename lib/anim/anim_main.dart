import 'package:flutter/material.dart';
import 'package:flutter_first_app/anim/run_ball_01.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(child: RunBallWidget()),
      ),
    );
  }
}
