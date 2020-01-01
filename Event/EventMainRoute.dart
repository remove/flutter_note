import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Event/DragTestRoute.dart';
import 'package:my_app/Event/GestureDetector.dart';
import 'package:my_app/Event/GestureRecognizer.dart';
import 'package:my_app/Event/NotificationTestRoute.dart';
import 'package:my_app/Event/TouchEventTestRoute.dart';

class EventMainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(platform: TargetPlatform.iOS),
      initialRoute: "EventMainRouteHome",
      routes: {
        "EventMainRouteHome": (context) => EventMainRouteHome(),
        "TouchEventTestRoute": (context) => TouchEventTestRoute(),
        "GestureDetectorTestRoute": (context) => GestureDetectorTestRoute(),
        "DragTestRoute": (context) => DragTestRoute(),
        "GestureRecognizerTestRoute": (context) => GestureRecognizerTestRoute(),
        "NotificationTestRoute": (context) => NotificationTestRoute(),
      },
    );
  }
}

class EventMainRouteHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("事件处理"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("触摸事件"),
              color: Colors.blue,
              colorBrightness: Brightness.dark,
              onPressed: () {
                Navigator.pushNamed(context, "TouchEventTestRoute");
              },
            ),
            FlatButton(
              child: Text("手势识别"),
              color: Colors.blue,
              colorBrightness: Brightness.dark,
              onPressed: () {
                Navigator.pushNamed(context, "GestureDetectorTestRoute");
              },
            ),
            FlatButton(
              child: Text("拖动"),
              color: Colors.blue,
              colorBrightness: Brightness.dark,
              onPressed: () {
                Navigator.pushNamed(context, "DragTestRoute");
              },
            ),
            FlatButton(
              child: Text("手势转换为语义手势"),
              color: Colors.blue,
              colorBrightness: Brightness.dark,
              onPressed: () {
                Navigator.pushNamed(context, "GestureRecognizerTestRoute");
              },
            ),
            FlatButton(
              child: Text("通知冒泡"),
              color: Colors.blue,
              colorBrightness: Brightness.dark,
              onPressed: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => NotificationTestRoute()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
