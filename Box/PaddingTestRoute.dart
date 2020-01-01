import 'package:flutter/material.dart';

class PaddingTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 100,
            height: 130,
            color: Colors.blue,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Container(
              width: 300,
              height: 100,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
