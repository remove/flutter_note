import 'package:flutter/material.dart';

class TouchEventTestRoute extends StatefulWidget {
  @override
  _TouchEventTestRouteState createState() => _TouchEventTestRouteState();
}

class _TouchEventTestRouteState extends State<TouchEventTestRoute> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300, 200)),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue),
                ),
              ),
              onPointerDown: (event) => print("Down 0"),
            ),
          ),
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(200, 100)),
              child: Center(
                child: Text("左上角200*100范围非文本区域点击"),
              ),
            ),
            onPointerDown: (event) => print("Down 1"),
            behavior: HitTestBehavior.translucent,
          ),
          Listener(
            //忽略触摸响应
            //如果使用AbsorbPointer,此Listener还是会响应，不过AbsorbPointer子树下的组件不会响应
            child: IgnorePointer(
              child: Listener(
                child: Container(
                  color: Colors.red,
                  width: 200,
                  height: 100,
                ),
                onPointerDown: (event) => print("in"),
              ),
            ),
            onPointerDown: (event) => print("out"),
          ),
        ],
      ),
    );
  }
}
