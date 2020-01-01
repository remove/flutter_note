import 'package:flutter/material.dart';
import 'package:my_app/customer/CustomPaintRoute.dart';
import 'package:my_app/customer/GradientButtonTestRoute.dart';
import 'package:my_app/customer/GradientCircularProgressRoute.dart';
import 'package:my_app/customer/TurnBoxRoute.dart';

class CustomMainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义组件"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("组合组件"),
              colorBrightness: Brightness.dark,
              color: Colors.pinkAccent,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GradientButtonTestRoute()));
              },
            ),
            FlatButton(
              child: Text("组合实例"),
              colorBrightness: Brightness.dark,
              color: Colors.pinkAccent,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TurnBoxRoute()));
              },
            ),
            FlatButton(
              child: Text("自绘组件"),
              colorBrightness: Brightness.dark,
              color: Colors.pinkAccent,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CustomPaintRoute()));
              },
            ),
            FlatButton(
              child: Text("自绘实例"),
              colorBrightness: Brightness.dark,
              color: Colors.pinkAccent,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GradientCircularProgressRoute()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
