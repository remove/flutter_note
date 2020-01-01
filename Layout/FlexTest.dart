import 'package:flutter/material.dart';

class FlexTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Flex(
            //水平排列
            direction: Axis.horizontal,
            //水平方向的纵轴对齐位置
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30,
                  color: Colors.green,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 100,
              child: Flex(
                //垂直方向排列,也可以用Column
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 30,
                    width: 30,
                    color: Colors.blue,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30,
                      color: Colors.red,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 300,
            child: Wrap(
              spacing: 20,
              alignment: WrapAlignment.start,
              children: <Widget>[
                Chip(
                  avatar: new CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('A'),
                  ),
                  label: Text("Aero"),
                ),
                Chip(
                  avatar: new CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('A'),
                  ),
                  label: Text("Aero"),
                ),
                Chip(
                  avatar: new CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('A'),
                  ),
                  label: Text("Aero"),
                ),
                Chip(
                  avatar: new CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('A'),
                  ),
                  label: Text("Aero"),
                ),
                Chip(
                  avatar: new CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('A'),
                  ),
                  label: Text("Aero"),
                ),
                Chip(
                  avatar: new CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('A'),
                  ),
                  label: Text("Aero"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
