import 'package:flutter/material.dart';
import 'package:my_app/Basic/PhotoWidget.dart';

import 'ButtonRoute.dart';
import 'FormRoute.dart';
import 'LinearProgress.dart';
import 'SwitchAndCheckBox.dart';
import 'TextAndFormRoute.dart';
import 'TextRoute.dart';

class BasicRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "BasicRoute",
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent
      ),
      routes: {
        "BasicRoute": (context) => BasicHome(),
        "TextRoute": (context) => TextRoute(),
        "ButtonRoute": (context) => ButtonRoute(),
        "PhotoRoute": (context) => PhotoWidget(),
        "SwitchAndCheckBoxRoute": (context) => SwitchAndCheckBox(),
        "TextAndFormRoute": (context) => TextAndFormRoute(),
        "FormRoute": (context) => FormRoute(),
        "LinearProgress": (context) => LinerProgress()
      },
    );
  }
}

class BasicHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter组件"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.deepPurpleAccent,
              colorBrightness: Brightness.dark,
              child: Text("Text组件"),
              onPressed: () {
                Navigator.pushNamed(context, "TextRoute");
              },
            ),
            FlatButton(
              color: Colors.deepPurpleAccent,
              colorBrightness: Brightness.dark,
              child: Text("按钮组件"),
              onPressed: () {
                Navigator.pushNamed(context, "ButtonRoute");
              },
            ),
            FlatButton(
              color: Colors.deepPurpleAccent,
              colorBrightness: Brightness.dark,
              child: Text("图片和图标组件"),
              onPressed: () {
                Navigator.pushNamed(context, "PhotoRoute");
              },
            ),
            FlatButton(
              color: Colors.deepPurpleAccent,
              colorBrightness: Brightness.dark,
              child: Text("单选开关和复选框"),
              onPressed: () {
                Navigator.pushNamed(context, "SwitchAndCheckBoxRoute");
              },
            ),
            FlatButton(
              color: Colors.deepPurpleAccent,
              colorBrightness: Brightness.dark,
              child: Text("输入框和表单"),
              onPressed: () {
                Navigator.pushNamed(context, "TextAndFormRoute");
              },
            ),
            FlatButton(
              color: Colors.deepPurpleAccent,
              colorBrightness: Brightness.dark,
              child: Text("表单和校验"),
              onPressed: () {
                Navigator.pushNamed(context, "FormRoute");
              },
            ),
            FlatButton(
              color: Colors.deepPurpleAccent,
              colorBrightness: Brightness.dark,
              child: Text("进度指示器"),
              onPressed: () {
                Navigator.pushNamed(context, "LinearProgress");
              },
            )
          ],
        ),
      ),
    );
  }
}
