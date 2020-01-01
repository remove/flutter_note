import 'package:flutter/material.dart';
import 'package:my_app/Box/AeroButton.dart';
import 'package:my_app/Box/BoxTest.dart';
import 'package:my_app/Box/PaddingTestRoute.dart';
import 'package:my_app/Box/ScaffoldRoute.dart';

class BoxRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepOrange),
      initialRoute: "BoxRouteHome",
      routes: {
        "BoxRouteHome": (context) => BoxRouteHome(),
        "PaddingTestRoute": (context) => PaddingTestRoute(),
        "BoxTest": (context) => BoxTest(),
        "AeroButton": (context) => AeroButton(),
        "ScaffoldRoute": (context) => ScaffoldRoute(),
      },
    );
  }
}

class BoxRouteHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter容器"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.deepOrange,
              colorBrightness: Brightness.dark,
              child: Text("Padding填充"),
              onPressed: () {
                Navigator.pushNamed(context, "PaddingTestRoute");
              },
            ),
            FlatButton(
              color: Colors.deepOrange,
              colorBrightness: Brightness.dark,
              child: Text("尺寸限制容器"),
              onPressed: () {
                Navigator.pushNamed(context, "BoxTest");
              },
            ),
            FlatButton(
              color: Colors.deepOrange,
              colorBrightness: Brightness.dark,
              child: Text("AeroButton"),
              onPressed: () {
                Navigator.pushNamed(context, "AeroButton");
              },
            ),
            FlatButton(
              color: Colors.deepOrange,
              colorBrightness: Brightness.dark,
              child: Text("Scaffold页面"),
              onPressed: () {
                Navigator.pushNamed(context, "ScaffoldRoute");
              },
            )
          ],
        ),
      ),
    );
  }
}
