import 'dart:math' as math;

import 'package:flutter/material.dart';

class BoxTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我都不知道在骚什么"),
      ),
      //限制容器，限制大小后强制组件适配
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: Container(
                height: 30,
//              child: redBox,
              ),
            ),
            Positioned(
              top: 20,
              left: 70,
              //装饰容器
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.redAccent, Colors.redAccent],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.redAccent,
                        offset: Offset(2, 5),
                        blurRadius: 20)
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 100),
                  child: Text(
                    "25:00",
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 300,
              left: 200,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: Transform.translate(
                  offset: Offset(-20, -5),
                  child: Text("Helloworld"),
                ),
              ),
            ),
            Positioned(
              top: 400,
              left: 150,
              child: Container(
                color: Colors.grey,
                child: new Transform(
                  alignment: Alignment.topRight,
                  transform: new Matrix4.skewY(0.3),
                  child: new Container(
                    padding: const EdgeInsets.only(top: 10),
                    color: Colors.deepOrange,
                    child: const Text("6666666666666"),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 500,
              left: 200,
              child: Container(
                color: Colors.grey,
                child: new Transform.rotate(
                  angle: math.pi / 2,
                  alignment: Alignment.topRight,
                  child: new Container(
                    padding: const EdgeInsets.only(top: 10),
                    color: Colors.deepOrange,
                    child: const Text("66666"),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 600,
              left: 200,
              child: Container(
                color: Colors.red,
                child: Transform.scale(
                  scale: 2,
                  child: Text("Aero"),
                ),
              ),
            ),
            Positioned(
              top: 650,
              left: 160,
              child: aero,
            ),
            Positioned(
              top: 130,
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Text("这是番茄钟"),
                  forward,
                ],
              ),
            ),
            Positioned(
              top: 290,
              left: 80,
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Text("这是偏移"),
                  forward,
                ],
              ),
            ),
            Positioned(
              top: 380,
              left: 30,
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Text("这是矩阵转换"),
                  forward,
                ],
              ),
            ),
            Positioned(
              top: 480,
              left: 100,
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Text("这是旋转"),
                  forward,
                ],
              ),
            ),
            Positioned(
              top: 595,
              left: 70,
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Text("这是缩放"),
                  forward,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  Widget forward = Icon(
    Icons.forward,
    color: Colors.deepOrange,
  );

  Widget aero = Container(
    constraints: BoxConstraints(
        minWidth: 100,
        minHeight: 80
    ),
    decoration: BoxDecoration(
        gradient: RadialGradient(
            colors: [Colors.orangeAccent, Colors.deepOrange],
            center: Alignment.topLeft,
            radius: .98
        ),
        boxShadow: [BoxShadow(
            color: Colors.deepOrange,
            blurRadius: 12,
            offset: Offset(5,5)
        )]
    ),
    transform: Matrix4.rotationZ(.2),
    alignment: Alignment.center,
    child: Text(
      "Aero",
      style: TextStyle(
          color: Colors.white,
          fontSize: 30
      ),
    ),
  );
}
