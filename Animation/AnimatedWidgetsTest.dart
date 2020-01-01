import 'package:flutter/material.dart';
import 'package:my_app/Animation/AnimatedDecoratedBox.dart';

class AnimatedWidgetsTest extends StatefulWidget {
  @override
  _AnimatedWidgetsTestState createState() => _AnimatedWidgetsTestState();
}

class _AnimatedWidgetsTestState extends State<AnimatedWidgetsTest> {
  double _padding = 10;
  var _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;
  TextStyle _style = TextStyle(color: Colors.black);
  Color _decorationColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    var duration = Duration(seconds: 1);
    return Scaffold(
      appBar: AppBar(
        title: Text("过渡组件测试"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _padding = 30;
                  });
                },
                child: AnimatedPadding(
                  duration: duration,
                  padding: EdgeInsets.all(_padding),
                  child: Text("AnimatedPadding"),
                ),
              ),
              SizedBox(
                height: 50,
                child: Stack(
                  children: <Widget>[
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                      left: _left,
                      child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            _left = _left == 100 ? 0 : 100;
                          });
                        },
                        child: Text("AnimatedPositioned"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                color: Colors.grey,
                child: AnimatedAlign(
                  duration: Duration(milliseconds: 500),
                  alignment: _align,
                  curve: Curves.linear,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        _align = _align == Alignment.center
                            ? Alignment.topRight
                            : Alignment.center;
                      });
                    },
                    child: Text("AnimatedAlign"),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: duration,
                height: _height,
                color: _color,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _height = 150;
                      _color = Colors.blue;
                    });
                  },
                  child: Text(
                    "AnimatedContainer",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              AnimatedDefaultTextStyle(
                child: GestureDetector(
                  child: Text("hello World"),
                  onTap: () {
                    setState(() {
                      _style = TextStyle(
                        color: Colors.blue,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: Colors.blue,
                      );
                    });
                  },
                ),
                style: _style,
                duration: duration,
              ),
              AnimatedDecoratedBox(
                duration: duration,
                decoration: BoxDecoration(color: _decorationColor),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _decorationColor = Colors.red;
                    });
                  },
                  child: Text(
                    "AnimatedDecorateBox",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ].map((e) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: e,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
