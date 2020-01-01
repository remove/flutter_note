import 'package:flutter/material.dart';

class ThemeTestRoute extends StatefulWidget {
  @override
  _ThemeTestRouteState createState() => _ThemeTestRouteState();
}

class _ThemeTestRouteState extends State<ThemeTestRoute> {
  Color _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
          primarySwatch: _themeColor,
          iconTheme: IconThemeData(color: _themeColor)),
      child: Scaffold(
        appBar: AppBar(
          title: Text("主题测试"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.airline_seat_flat_angled),
                Icon(Icons.call_end),
                Icon(Icons.four_k),
                Text("颜色跟随主题")
              ],
            ),
            Theme(
              //因为这里处于子树，下面的child会向上查找。所以这里会覆盖上面的themeData
              data: themeData.copyWith(
                  iconTheme: themeData.iconTheme.copyWith(color: Colors.black)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.add_alarm),
                  Icon(Icons.airplay),
                  Text("颜色固定黑色")
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(
            () => _themeColor =
                _themeColor == Colors.teal ? Colors.blue : Colors.teal,
          ),
          child: Icon(Icons.palette),
        ),
      ),
    );
  }
}
