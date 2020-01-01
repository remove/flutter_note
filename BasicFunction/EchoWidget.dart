import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//组件传递参数
class EchoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        //传递参数
        child: Echo(text: 'emheng'),
      ),
    );
  }
}

class Echo extends StatelessWidget {
  //构造函数接收参数
  const Echo({
    Key key,
    @required this.text,
    this.backgroundColor: Colors.grey,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}
