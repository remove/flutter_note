import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮组件"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton.icon(
              color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                elevation: 10,
                onPressed: _onPressed,
                icon: Icon(Icons.send),
                label: Text("发送")),
            OutlineButton.icon(
              onPressed: _onPressed,
              icon: Icon(Icons.add),
              label: Text("添加"),
            ),
            FlatButton.icon(
                onPressed: _onPressed,
                icon: Icon(Icons.info),
                label: Text("详情")
            ),
          ],
        ),
      ),
    );
  }

  _onPressed() {}
}
