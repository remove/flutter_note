import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureRecognizerTestRoute extends StatefulWidget {
  @override
  _GestureRecognizerTestRouteState createState() =>
      _GestureRecognizerTestRouteState();
}

class _GestureRecognizerTestRouteState
    extends State<GestureRecognizerTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _GestureRecognizer(),
    );
  }
}

class _GestureRecognizer extends StatefulWidget {
  @override
  __GestureRecognizerState createState() => __GestureRecognizerState();
}

class __GestureRecognizerState extends State<_GestureRecognizer> {
  //初始化识别器
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false;

  //使用GestureRecognizer后一定要调用dispose释放资源（主要是取消内部计时器)
  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: "你好世界"),
            TextSpan(
              text: " 点我变色",
              style: TextStyle(
                fontSize: 30,
                color: _toggle ? Colors.blue : Colors.red,
              ),
              //将识别器使用在非组件上
              recognizer: _tapGestureRecognizer
                ..onTap = () {
                  setState(
                    () {
                      _toggle = !_toggle;
                    },
                  );
                },
            )
          ],
        ),
      ),
    );
  }
}
