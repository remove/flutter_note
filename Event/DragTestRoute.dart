import 'package:flutter/material.dart';

class DragTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("拖动识别"),),
      body: _Drag(),
    );
  }
}

class _Drag extends StatefulWidget {
  @override
  __DragState createState() => __DragState();
}

class __DragState extends State<_Drag> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text("A"),
            ),
//            onPanDown: (DragDownDetails e) {
//              print("用户手指按下：${e.globalPosition}");
//            },
//            onPanUpdate 自由拖动
//            onVerticalDragUpdate 垂直拖动
          //横向拖动
            onHorizontalDragUpdate: (DragUpdateDetails e) {
              setState(() {
                _left += e.delta.dx;
              });
            },
            //横竖同时开启用于竞争测试
            onVerticalDragUpdate: (DragUpdateDetails e){
              setState(() {
                _top += e.delta.dy;
              });
            },
//            onPanEnd: (DragEndDetails e) {
////              print("用户抬起于：${e.velocity}");
////            },
          ),
        )
      ],
    );
  }
}