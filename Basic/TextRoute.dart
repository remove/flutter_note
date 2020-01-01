import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文本组件"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Hello world",
            textAlign: TextAlign.left,
          ),
          Text(
            "Aero 666 NIUB" * 10,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textScaleFactor: 1.5,
            style: TextStyle(
              color: Colors.pink,
              height: 2,
              fontFamily: "Courier",
              background: new Paint()..color = Colors.yellow,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed,
            ),
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
              text: "Home: ",
            ),
            TextSpan(
              text: "https://aeronote.net",
              style: TextStyle(color: Colors.blue),
            )
          ])),
          DefaultTextStyle(
            style: TextStyle(color: Colors.green, fontSize: 20),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("接盘侠"),
                Text("接盘侠"),
                Text(
                  "不接盘的",
                  style: TextStyle(inherit: false, color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
