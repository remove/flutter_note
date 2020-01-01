import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Event/NotificationRoute.dart';

class NotificationTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("通知冒泡"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.blue,
              colorBrightness: Brightness.dark,
              onPressed: () => Navigator.of(context).push(
                  CupertinoPageRoute(builder: (context) => NotificationRoute())),
              child: Text("自定义通知"),
            )
          ],
        ),
      ),
    );
  }
}
