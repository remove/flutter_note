import 'package:flutter/material.dart';

class GestureDetectorTestRoute extends StatefulWidget {
  @override
  _GestureDetectorTestRouteState createState() =>
      _GestureDetectorTestRouteState();
}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute> {
  String _operation = "No Gesture detected!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势识别"),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200,
            height: 100,
            child: Text(
              _operation,
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () => updateText("Tap"),
          onDoubleTap: () => updateText("DoubleTap"),
          onLongPress: () => updateText("LongPress"),
        ),
      ),
    );
  }

  void updateText(String text) {
    setState(() {
      _operation = text;
    });
  }
}

