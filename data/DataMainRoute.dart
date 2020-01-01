import 'package:flutter/material.dart';
import 'package:my_app/data/FileOpreationRoute.dart';
import 'package:my_app/data/FutureBuilderRouteState.dart';
import 'package:my_app/data/HttpClientTestRoute.dart';
import 'package:my_app/data/WebSocketRoute.dart';

class DataMainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文件和网络"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("文件操作"),
              color: Colors.blue,
              colorBrightness: Brightness.dark,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FileOperationRoute()));
              },
            ),
            FlatButton(
              child: Text("Http请求"),
              color: Colors.blue,
              colorBrightness: Brightness.dark,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HttpClientTestRoute()));
              },
            ),
            FlatButton(
              child: Text("Dio"),
              color: Colors.blue,
              colorBrightness: Brightness.dark,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FutureBuilderRouteState()));
              },
            ),
            FlatButton(
              child: Text("WebSocket"),
              color: Colors.blue,
              colorBrightness: Brightness.dark,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WebSocketRoute()));
              },
            )
          ],
        ),
      ),
    );
  }
}
