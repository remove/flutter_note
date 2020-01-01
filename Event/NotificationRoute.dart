import 'package:flutter/material.dart';

class NotificationRoute extends StatefulWidget {
  @override
  _NotificationRouteState createState() => _NotificationRouteState();
}

class _NotificationRouteState extends State<NotificationRoute> {
  String _msg = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //监听通知MyNotification
      body: NotificationListener<MyNotification>(
        onNotification: (n){
          print(n.msg);
          return true;
        },
        child: NotificationListener<MyNotification>(
          onNotification: (n){
            setState(() {
              _msg += n.msg+" ";
            });
            //多嵌套一层，true为阻止冒泡向上传递
            return true;
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Builder(
                  builder: (context){
                    return FlatButton(
                      //直接调用MyNotification发送通知给上级
                      onPressed: () => MyNotification("Hi").dispatch(context),
                      child: Text("Send Notification"),
                    );
                  },
                ),
                //回显
                Text(_msg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);

  final String msg;
}
