import 'package:flutter/material.dart';
import 'package:my_app/Function/DataSharePageOne.dart';
import 'package:my_app/Function/InheritedTestRoute.dart';
import 'package:my_app/Function/ProviderRoute.dart';

class FunctionMainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.indigo),
      initialRoute: "FunctionMainRouteHome",
      routes: {
        "FunctionMainRouteHome": (context) => FunctionMainRouteHome(),
        "InheritedTestRoute": (context) => InheritedTestRoute(),
        "ProviderRoute": (context) => ProviderRoute(),
        "DataSharePageOne": (context) => DataSharePageOne(),
      },
    );
  }
}

class FunctionMainRouteHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("功能型组件"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              colorBrightness: Brightness.dark,
              color: Colors.indigo,
              child: Text("数据共享"),
              onPressed: (){
                Navigator.pushNamed(context, "InheritedTestRoute");
              },
            ),
            FlatButton(
              colorBrightness: Brightness.dark,
              color: Colors.indigo,
              child: Text("ProviderRoute"),
              onPressed: (){
                Navigator.pushNamed(context, "ProviderRoute");
              },
            ),
            FlatButton(
              colorBrightness: Brightness.dark,
              color: Colors.indigo,
              child: Text("DataShare"),
              onPressed: (){
                Navigator.pushNamed(context, "DataSharePageOne");
              },
            ),
          ],
        ),
      ),
    );
  }
}
