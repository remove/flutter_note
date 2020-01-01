import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Animation/AnimationMainRoute.dart';
import 'package:my_app/Basic/BasicRoute.dart';
import 'package:my_app/BasicFunction/BasicFunction.dart';
import 'package:my_app/Box/BoxRoute.dart';
import 'package:my_app/Event/EventMainRoute.dart';
import 'package:my_app/Function/FunctionMainRoute.dart';
import 'package:my_app/Layout/FlexRoute.dart';
import 'package:my_app/Scroll/ListViewMain.dart';
import 'package:my_app/customer/CustomMainRoute.dart';
import 'package:my_app/data/DataMainRoute.dart';
import 'package:my_app/theme/ThemeMainRoute.dart';
import 'package:provider/provider.dart';

import 'model/CountModel.dart';

void main() {
  final counter = CountModel();
  final textSize = 48;

  runApp(
    MultiProvider(
      providers: [
        //恒定数据
        Provider.value(value: textSize),
        //活动数据，通知使用的子组件刷新
        ChangeNotifierProvider.value(value: counter)
      ],
      child: MyApp(),
    ),
//    Provider<int>.value(
//      //此处是恒定的数据
//      value: textSize,
//      child: ChangeNotifierProvider.value(
//        //此处是活动的数据，会通知使用的子组件刷新
//        value: counter,
//        child: MyApp(),
//      ),
//    ),
  );
  //复杂情况需要dispose时使用Provider默认构造方法
//  Provider(
//    builder: (_) => ValidatorBloc(),
//    dispose: (_, ValidatorBloc bloc) => bloc.dispose(),
//  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      theme:
          ThemeData(primarySwatch: Colors.pink, platform: TargetPlatform.iOS),
      routes: {
        "/": (context) => MyHomePage(title: 'Flutter Note'),
        "BasicFunction": (context) => BasicFunction(),
        "BasicRoute": (context) => BasicRoute(),
        "FlexRoute": (context) => FlexRoute(),
        "BoxRoute": (context) => BoxRoute(),
        "ListViewMain": (context) => ListViewMain(),
        "FunctionMainRoute": (context) => FunctionMainRoute(),
        "ThemeMainRoute": (context) => ThemeMainRoute(),
        "EventMainRoute": (context) => EventMainRoute(),
        "AnimaitonMainRoute": (context) => AnimationMainRoute(),
        "CustomMainRoute": (context) => CustomMainRoute(),
        "DataMainRoute": (context) => DataMainRoute(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.pink,
              colorBrightness: Brightness.dark,
              child: Text("基础"),
              onPressed: () {
                Navigator.pushNamed(context, "BasicFunction");
              },
            ),
            FlatButton(
              color: Colors.pink,
              colorBrightness: Brightness.dark,
              child: Text("组件"),
              onPressed: () {
                Navigator.pushNamed(context, "BasicRoute");
              },
            ),
            FlatButton(
              color: Colors.pink,
              colorBrightness: Brightness.dark,
              child: Text("布局"),
              onPressed: () {
                Navigator.pushNamed(context, "FlexRoute");
              },
            ),
            FlatButton(
              color: Colors.pink,
              colorBrightness: Brightness.dark,
              child: Text("容器"),
              onPressed: () {
                Navigator.pushNamed(context, "BoxRoute");
              },
            ),
            FlatButton(
              color: Colors.pink,
              colorBrightness: Brightness.dark,
              child: Text("列表"),
              onPressed: () {
                Navigator.pushNamed(context, "ListViewMain");
              },
            ),
            FlatButton(
              color: Colors.pink,
              colorBrightness: Brightness.dark,
              child: Text("功能"),
              onPressed: () {
                Navigator.pushNamed(context, "FunctionMainRoute");
              },
            ),
            FlatButton(
              color: Colors.pink,
              colorBrightness: Brightness.dark,
              child: Text("主题"),
              onPressed: () {
                Navigator.pushNamed(context, "ThemeMainRoute");
              },
            ),
            FlatButton(
              color: Colors.pink,
              colorBrightness: Brightness.dark,
              child: Text("事件"),
              onPressed: () {
                Navigator.pushNamed(context, "EventMainRoute");
              },
            ),
            FlatButton(
              color: Colors.pink,
              colorBrightness: Brightness.dark,
              child: Text("动画"),
              onPressed: () {
                Navigator.pushNamed(context, "AnimaitonMainRoute");
              },
            ),
            FlatButton(
              color: Colors.pink,
              colorBrightness: Brightness.dark,
              child: Text("自定"),
              onPressed: () {
                Navigator.pushNamed(context, "CustomMainRoute");
              },
            ),
            FlatButton(
              color: Colors.pink,
              colorBrightness: Brightness.dark,
              child: Text("数据"),
              onPressed: () {
                Navigator.pushNamed(context, "DataMainRoute");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ValidatorBloc {
  StreamController<String> _validator = StreamController<String>.broadcast();

  get validator => _validator.stream;

  validateAccount(String text) {}

  dispose() {
    _validator.close();
  }
}
