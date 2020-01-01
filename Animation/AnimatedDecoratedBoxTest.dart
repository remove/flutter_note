import 'package:flutter/material.dart';
import 'package:my_app/Animation/AnimatedDecoratedBox1.dart';

class AnimatedDecoratedBoxTest extends StatefulWidget {
  @override
  _AnimatedDecoratedBoxTestState createState() =>
      _AnimatedDecoratedBoxTestState();
}

class _AnimatedDecoratedBoxTestState extends State<AnimatedDecoratedBoxTest> {
  Color _decorationColor = Colors.blue;
  var duration = Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedDecoratedBox1(
          decoration: BoxDecoration(color: _decorationColor),
          duration: duration,
          child: FlatButton(
            onPressed: () {
              setState(() {
                _decorationColor = Colors.red;
              });
            },
            child: Text(
              "AnimatedDecorateBox",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
