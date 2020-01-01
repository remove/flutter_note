import 'package:flutter/material.dart';
import 'package:my_app/customer/GradientButton.dart';

class GradientButtonTestRoute extends StatefulWidget {
  @override
  _GradientButtonTestRouteState createState() => _GradientButtonTestRouteState();
}

class _GradientButtonTestRouteState extends State<GradientButtonTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            GradientButton(
              colors: [Colors.orange, Colors.red],
              height: 50,
              onPressed: onPressed,
              child: Text("Submit"),
            ),
            GradientButton(
              colors: [Colors.grey, Colors.black],
              height: 50,
              onPressed: onPressed,
              child: Text("Submit"),
            ),
            GradientButton(
              colors: [Colors.blue, Colors.deepPurple],
              height: 50,
              onPressed: onPressed,
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
  void onPressed(){}
}
