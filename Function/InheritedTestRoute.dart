import 'package:flutter/material.dart';

class InheritedTestRoute extends StatefulWidget {
  @override
  _InheritedTestRouteState createState() => _InheritedTestRouteState();
}

class _InheritedTestRouteState extends State<InheritedTestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("数据共享"),
      ),
      body: Center(
        child: ShareDataWidget(
          data: count,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text("$count"),
                ),
                FlatButton(
                  color: Colors.indigo,
                  colorBrightness: Brightness.dark,
                  child: Text("自增"),
                  onPressed: () => setState(() => ++count),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//数据共享类
class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({@required this.data, Widget child}) : super(child: child);
  final int data;

  // 暴露of方法。
  static ShareDataWidget of(BuildContext context) {
    //返回下面的方法注册ShareDataWidget
    //inheritFromWidgetOfExactType 会注册依赖关系
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
//  return context.ancestorInheritedElementForWidgetOfExactType(ShareDataWidget).widget;
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}

//数据读取
class _TestWidget extends StatefulWidget {
  @override
  __TestWidgetState createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    //调用ShareDataWidget暴露的of方法，返回的是构造注册依赖关系的ShareDataWidget，
    // 所以可以直接拿到新数据
    return Text(ShareDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("依赖改变");
  }
}
