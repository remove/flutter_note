import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogTestRoute extends StatefulWidget {
  @override
  _AlertDialogTestRouteState createState() => _AlertDialogTestRouteState();
}

class _AlertDialogTestRouteState extends State<AlertDialogTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.indigoAccent,
              colorBrightness: Brightness.dark,
              child: Text("普通提示框"),
              onPressed: () async {
                bool delete = await showDeleteConfirmDialog1(context);
                if (delete == null) {
                  print("取消删除");
                } else {
                  print("确认删除");
                }
              },
            ),
            FlatButton(
              colorBrightness: Brightness.dark,
              color: Colors.indigoAccent,
              child: Text("多项提示框"),
              onPressed: () async {
                String type = await changeLanguage(context);
                print(type);
              },
            ),
            FlatButton(
              colorBrightness: Brightness.dark,
              color: Colors.indigoAccent,
              child: Text("列表提示框"),
              onPressed: () => showListDialog(context),
            ),
            FlatButton(
                colorBrightness: Brightness.dark,
                color: Colors.indigoAccent,
                child: Text("状态提示框"),
                onPressed: () => {}),
            FlatButton(
              colorBrightness: Brightness.dark,
              color: Colors.indigoAccent,
              onPressed: () => showDeleteConfirmDialog(context),
              child: Text("状态提示框2"),
            ),
            FlatButton(
              colorBrightness: Brightness.dark,
              color: Colors.indigoAccent,
              child: Text("底部提示框"),
              onPressed: () async {
                int type = await _showModalBottomSheet(context);
                print("点击了:${type.toString()}");
              },
            ),
            FlatButton(
              colorBrightness: Brightness.dark,
              color: Colors.indigoAccent,
              child: Text("日期选择框"),
              onPressed: () => _showDatePicker(context),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> showDeleteConfirmDialog(BuildContext context) {
    //自身管理状态
    bool _withTree = false;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录?"),
                  //构建的方法需要多包裹StatefulBuilder,因为在点击显示的时候的context不是在这里
//                  StatefulBuilder(
//                    //context为Checkbox的真正context，_setState为代理方法
//                    builder: (context, _setState) {
//                      return Checkbox(
//                        onChanged: (bool value) {
//                          _setState(() {
//                            _withTree = !_withTree;
//                          });
//                        },
//                        value: _withTree,
//                      );
//                    },
                  //用Builder构建一个小范围的context
                  //如果不加Builder缩小范围为Checkbox。将会导致整个对话框UI刷新
                  Builder(builder: (BuildContext context) {
                    return Checkbox(
                      value: _withTree,
                      onChanged: (bool value) {
                        //此时的context为对话框的UI的根Element，直接标记为脏东西，
                        //重新渲染
                        (context as Element).markNeedsBuild();
                        _withTree = !_withTree;
                      },
                    );
                  })
//                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

Future<bool> showDeleteConfirmDialog1(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("您确定要删除当前文件吗?"),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(), // 关闭对话框
          ),
          FlatButton(
            child: Text("删除"),
            onPressed: () {
              //关闭对话框并返回true
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}

Future<String> changeLanguage(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text("请选择语言"),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, "简体中文");
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: const Text('中文简体'),
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, "美国英语");
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text("美国英语"),
            ),
          )
        ],
      );
    },
  );
}

Future<void> showListDialog(BuildContext context) async {
  int index = await showDialog(
    context: context,
    builder: (BuildContext context) {
      var child = Column(
        children: <Widget>[
          ListTile(
            title: Text("请选择"),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("${index}"),
                  onTap: () => Navigator.of(context).pop(index),
                );
              },
            ),
          ),
        ],
      );
//        return Dialog(
//          child: child,
//        );
      return UnconstrainedBox(
        constrainedAxis: Axis.vertical,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 280),
          child: Material(
            child: child,
            type: MaterialType.card,
          ),
        ),
      );
    },
  );
  if (index != null) {
    print("点击了：${index}");
  }
}

Future<int> _showModalBottomSheet(BuildContext context) async {
  return showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("${index}"),
            onTap: () => Navigator.of(context).pop(index),
          );
        },
      );
    },
  );
}

Future<DateTime> _showDatePicker(BuildContext context) {
  var date = DateTime.now();
  return showCupertinoModalPopup(
    context: context,
    builder: (ctx) {
      return SizedBox(
        height: 200,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.dateAndTime,
          minimumDate: date,
          maximumDate: date.add(Duration(days: 30)),
          maximumYear: date.year + 1,
          onDateTimeChanged: (DateTime value) {
            print(value);
          },
        ),
      );
    },
  );
}
