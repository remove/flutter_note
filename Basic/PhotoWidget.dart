import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String icons = "";
    icons += "\uE914";
    icons += "\uE000";
    icons += "\uE90D";
    return Scaffold(
      appBar: AppBar(
        title: Text("图片和图标组件"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.network(
              "https://aeronote.net/wp-content/uploads/2019/01/banner_tiny.png",
              fit: BoxFit.contain,
            ),
            Image.asset(
              "images/avatar.png",
              height: 200,
              width: 400,
              repeat: ImageRepeat.repeatX,
            ),
            Image.asset(
              "images/avatar.png",
              height: 200,
              width: 400,
              fit: BoxFit.fill,
            ),
            Text(icons,
                style: TextStyle(
                    fontFamily: "MaterialIcons",
                    fontSize: 50,
                    color: Colors.green)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.settings,
                  color: Colors.pinkAccent,
                  size: 60,
                ),
                Icon(
                  Icons.access_alarms,
                  color: Colors.pinkAccent,
                  size: 60,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
