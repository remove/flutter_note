import 'package:flutter/material.dart';
import 'package:my_app/Scroll/CustomScrollViewTestRoute.dart';
import 'package:my_app/Scroll/GridViewTest.dart';
import 'package:my_app/Scroll/InfiniteListView.dart';
import 'package:my_app/Scroll/ListViewRoute.dart';
import 'package:my_app/Scroll/ScrollControllerTestRoute.dart';

class ListViewMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "ListViewMainHome",
      routes: {
        "ListViewMainHome": (context) => ListViewMainHome(),
        "ListViewRoute": (context) => ListViewRoute(),
        "InfiniteListView": (context) => InfiniteListView(),
        "GridViewTest": (context) => GirdViewTest(),
        "CustomScrollViewTestRoute": (context) => CustomScrollViewTestRoute(),
        "ScrollControllerTestRoute": (context) => ScrollControllerTestRoute(),
      },
    );
  }
}

class ListViewMainHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("可滚动组件"),
      ),
      body: Container(
        alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                colorBrightness: Brightness.dark,
                color: Colors.blue,
                child: Text("ListView"),
                onPressed: () {
                  Navigator.pushNamed(context, "ListViewRoute");
                },
              ),
              FlatButton(
                colorBrightness: Brightness.dark,
                color: Colors.blue,
                child: Text("无限列表"),
                onPressed: () {
                  Navigator.pushNamed(context, "InfiniteListView");
                },
              ),
              FlatButton(
                colorBrightness: Brightness.dark,
                color: Colors.blue,
                child: Text("网格列表"),
                onPressed: () {
                  Navigator.pushNamed(context, "GridViewTest");
                },
              ),
              FlatButton(
                colorBrightness: Brightness.dark,
                color: Colors.blue,
                child: Text("自定义滚动列表"),
                onPressed: () {
                  Navigator.pushNamed(context, "CustomScrollViewTestRoute");
                },
              ),
              FlatButton(
                colorBrightness: Brightness.dark,
                color: Colors.blue,
                child: Text("滚动控制"),
                onPressed: () {
                  Navigator.pushNamed(context, "ScrollControllerTestRoute");
                },
              ),
            ],
          ),
      ),
    );
  }
}
