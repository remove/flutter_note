import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key key, this.initValue: 0});

  final int initValue;

  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  //当Widget第一次插入到Widget树时调用
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('$_counter'),
          onPressed: () => setState(() => ++_counter),
        ),
      ),
    );
  }

  //当Widget重新构建的时候调用
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  //当State被移除的时候调用，用于State移动到另外的位置调用
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  //当State对象从树中永久移除的时候调用，用于释放资源
  void dispose() {
    super.dispose();
    print("dispose");
  }

  //为开发调试的提供，在热重载的时候调用，release模式下失效
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  //当State对象的依赖发生变化的时候调用，场景为切换主题或语言的时候调用
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
