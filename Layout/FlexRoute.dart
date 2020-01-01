import 'package:flutter/material.dart';
import 'package:my_app/Layout/FlexTest.dart';
import 'package:my_app/Layout/StackTest.dart' as prefix0;

class FlexRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      initialRoute: "FlexRouteHome",
      routes: {
        "FlexRouteHome": (context) => FlexRouteHome(),
        "FlexTest": (context) => FlexTest(),
        "StackTest": (context) => prefix0.StackTest(),
      },
    );
  }
}

class FlexRouteHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter布局"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text(
                "弹性布局"
              ),
              colorBrightness: Brightness.dark,
              color: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context, "FlexTest");
              },
            ),
            FlatButton(
              child: Text(
                  "层叠布局"
              ),
              colorBrightness: Brightness.dark,
              color: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context, "StackTest");
              },
            )
          ],
        ),
      ),
    );

  }
}
