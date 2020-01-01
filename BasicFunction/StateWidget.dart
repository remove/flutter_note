import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StateWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("状态管理"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('内部管理状态'),
              onPressed: (){
                Navigator.pushNamed(context, "TapBoxA");
              },
            ),
            FlatButton(
              child: Text("父组件管理状态"),
              onPressed: (){
                Navigator.pushNamed(context, 'TapBoxB');
              },
            ),
            FlatButton(
              child: new Text("混合管理"),
              onPressed: (){
                Navigator.pushNamed(context, 'TapBoxC');
              },
            )
          ],
        ),
      ),
    );
  }

}