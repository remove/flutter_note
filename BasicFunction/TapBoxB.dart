import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TapBoxB extends StatefulWidget {
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<TapBoxB> {
  //设置_active状态默认为false
  bool _active = false;

  void _handlerTapboxChanged(bool newValue) {
    //生成状态
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      //构造子组件传入参数
      child: new TapboxB(
        onChanged: _handlerTapboxChanged,
        active: _active,
      ),
    );
  }
}

class TapboxB extends StatelessWidget {
  TapboxB({Key key, @required this.onChanged, this.active})
      : super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;

  //其实就是将_handlerTapboxChanged方法绑定到这里onChanged
  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration:
            new BoxDecoration(color: active ? Colors.lightGreen : Colors.grey),
      ),
    );
  }
}
