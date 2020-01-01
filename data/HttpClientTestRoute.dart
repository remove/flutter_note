import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class HttpClientTestRoute extends StatefulWidget {
  @override
  _HttpClientTestRouteState createState() => _HttpClientTestRouteState();
}

class _HttpClientTestRouteState extends State<HttpClientTestRoute> {
  bool _loading = false;
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("获取百度首页"),
                onPressed: _loading
                    ? null
                    : () async {
                        setState(() {
                          _loading = true;
                          _text = "请求中";
                        });
                        try {
                          HttpClient httpClient = new HttpClient();
                          HttpClientRequest request = await httpClient
                              .getUrl(Uri.parse("https://www.baidu.com"));
                          request.headers.add("user-agent",
                              "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
                          HttpClientResponse response = await request.close();
                          _text = await response.transform(utf8.decoder).join();
                          httpClient.close();
                        } catch (e) {
                          _text = "请求失败：$e";
                        } finally {
                          setState(
                            () {
                              _loading = false;
                            },
                          );
                        }
                      },
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Text(_text.replaceAll(RegExp(r"\s"), "")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
