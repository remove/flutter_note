import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/theme/AlertDialogTestRoute.dart';
import 'package:my_app/theme/FutureBuilderTestRoute.dart';
import 'package:my_app/theme/StreamBuilderTestRoute.dart';
import 'package:my_app/theme/ThemeTestRoute.dart';

class ThemeMainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "ThemeMainRouteHome",
      routes: {
        "ThemeMainRouteHome": (context) => ThemeMainRouteHome(),
        "ThemeTestRoute": (context) => ThemeTestRoute(),
        "FutureBuilderTestRoute": (context) => FutureBuilderTestRoute(),
        "StreamBuilderTestRoute": (context) => StreamBuilderTestRoute(),
        "AlertDialogTestRoute": (context) => AlertDialogTestRoute(),
      },
    );
  }
}

class ThemeMainRouteHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var c = "dc380d";
    return Scaffold(
      appBar: AppBar(
        title: Text("颜色和主题"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              colorBrightness: Brightness.dark,
              color: Colors.blue,
              child: Text("切换主题"),
              onPressed: () {
                Navigator.pushNamed(context, "ThemeTestRoute");
              },
            ),
            FlatButton(
              colorBrightness: Brightness.dark,
              color: Colors.blue,
              child: Text("异步构建"),
              onPressed: () {
                Navigator.pushNamed(context, "FutureBuilderTestRoute");
              },
            ),
            FlatButton(
              colorBrightness: Brightness.dark,
              color: Colors.blue,
              child: Text("流构建"),
              onPressed: () {
                Navigator.pushNamed(context, "StreamBuilderTestRoute");
              },
            ),
            FlatButton(
              colorBrightness: Brightness.dark,
              color: Colors.blue,
              child: Text("提示框"),
              onPressed: () {
                Navigator.pushNamed(context, "AlertDialogTestRoute");
              },
            )
          ],
        ),
      ),
    );
  }
}

