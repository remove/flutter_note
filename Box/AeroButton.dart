import 'package:flutter/material.dart';

class AeroButton extends StatefulWidget {
  @override
  _AeroButtonState createState() => _AeroButtonState();
}

class _AeroButtonState extends State<AeroButton> {
  double x = 5;
  double y = 5;
  double br = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我都不知道我在骚什么"),
      ),
      body: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.orangeAccent, Colors.deepOrange],
                    center: Alignment.topLeft,
                    radius: .98),
                boxShadow: [
                  BoxShadow(
                      color: Colors.deepOrange,
                      blurRadius: br,
                      offset: Offset(x, y))
                ]),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {},
                splashColor: Colors.red,
                highlightColor: Colors.transparent,
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(height: 60, width: 130),
                  child: Center(
                    child: Text(
                      "Aero",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _updateShadow() {
    setState(() {
      this.x = 0;
      this.y = 0;
    });
  }

  _cancelShadow() {
    setState(() {
      this.x = 5;
      this.y = 5;
    });
  }
}
