import 'package:flutter/material.dart';

class StackTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("层叠布局"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
//          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 100,
              child: Container(
                color: Colors.blue[50],
                child: Align(
                  widthFactor: 2,
                  heightFactor: 2,
                  //Alignment为居中原点，FractionalOffset左侧为原点
//                  alignment: Alignment(0.3,-0.3),
                  alignment: FractionalOffset(0.5,0.3),
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 18,
              bottom: 100,
              child: Text("I am Aero"),
            ),
            Container(
              child: Text(
                "HelloAero",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            ),
            Positioned(
              top: 18,
              child: Text("I am Neo"),
            )
          ],
        ),
      ),
    );
  }
}
