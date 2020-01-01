import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FutureBuilderRouteState extends StatefulWidget {
  @override
  _FutureBuilderRouteStateState createState() =>
      _FutureBuilderRouteStateState();
}

class _FutureBuilderRouteStateState extends State<FutureBuilderRouteState> {
  Dio _dio = new Dio();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //请求完成
            if (snapshot.connectionState == ConnectionState.done) {
              Response response = snapshot.data;
              //发生错误
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              //请求成功，通过项目信息构建用于显示项目名称的ListView
              return ListView(
                children: response.data
                    .map<Widget>((e) => ListTile(title: Text(e["full_name"])))
                    .toList(),
              );
            }
            //请求未完成时弹出loading
            return CircularProgressIndicator();
          }),
    );
  }
}
