import 'package:flutter/material.dart';
import 'package:my_app/Basic/BasicRoute.dart';

import 'CounterWidget.dart';
import 'EchoRoute.dart';
import 'NewRoute.dart';
import 'ParentTapBoxC.dart';
import 'StateTestWidget.dart';
import 'StateWidget.dart';
import 'TapBoxB.dart';
import 'TipRoute.dart';

class BasicFunction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "BasicFunctionHome",
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      routes: {
        "BasicFunctionHome": (context) => BasicRouteHome(),
        "new_page": (context) => NewRoute(),
        "rt": (context) => RouterTestRoute(),
        //虽然传了参数，可是在EchoRoute里面有获取的代码
        "echo_page": (context) => EchoRoute(),
        "tip_route": (context) {
          //在绑定路由这里先从RouteSetting里面获取text的参数
          return TipRoute(text: ModalRoute.of(context).settings.arguments);
        },
        "Echo": (context) => EchoRoute(),
        "count": (context) => CounterWidget(),
        "StateWidget": (context) => StateWidget(),
        "TapBoxA": (context) => TapboxA(),
        "TapBoxB": (context) => TapBoxB(),
        "TapBoxC": (context) => ParentTapBoxC(),
        "BasicRoute": (context) => BasicRoute()
      }
    );
  }
}
class BasicRouteHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter基础"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.deepOrange,
              colorBrightness: Brightness.dark,
              child: Text("路由"),
              onPressed: () {
                Navigator.pushNamed(context, "new_page");
              },
            ),
            FlatButton(
              color: Colors.deepOrange,
              colorBrightness: Brightness.dark,
              child: Text("带参路由"),
              onPressed: () {
                Navigator.pushNamed(context, "rt");
              },
            ),
            FlatButton(
              color: Colors.deepOrange,
              colorBrightness: Brightness.dark,
              child: Text("带参回响路由"),
              onPressed: () {
                //使用命名路由加arguments传递参数
                Navigator.pushNamed(context, "echo_page", arguments: '看到了吧');
              },
            ),
//            FlatButton(
//              child: Text("TipRoute"),
//              onPressed: () {

//                Navigator.pushNamed(context, "tip_route", arguments: 'tip666');
//              },
//            ),
//            FlatButton(
//              child: Text("传递参数"),
//              onPressed: () {
//                Navigator.pushNamed(context, "Echo");
//              },
//            ),
            FlatButton(
              color: Colors.deepOrange,
              colorBrightness: Brightness.dark,
              child: Text("计数器生命周期测试"),
              onPressed: () {
                Navigator.pushNamed(context, "count");
              },
            ),
//            FlatButton(
//              child: Text("ios风格"),
//              onPressed: () {
//                Navigator.pushNamed(context, 'ios');
//              },
//            ),
            FlatButton(
              color: Colors.deepOrange,
              colorBrightness: Brightness.dark,
              child: Text("状态管理"),
              onPressed: () {
                Navigator.pushNamed(context, 'StateWidget');
              },
            ),
            //随机英文
//            RandomWordsWidget(),
            //用Builder传递参数
//            Builder(
//              builder: (context) {
//                return RaisedButton(
//                  onPressed: () {
//                    //获取Scaffold状态，因为Scaffold希望暴露，所以可以直接Scaffold.of获得State
//                    ScaffoldState _state = Scaffold.of(context);
//                    _state.showSnackBar(SnackBar(
//                      content: Text('SnackBar'),
//                    ));
//                  },
//                  child: Text("显示SnackBar"),
//                );
//              },
//            ),
//            Builder(
//              builder: (context) {
//                return RaisedButton(
//                  onPressed: () {
//                    ScaffoldState _state = _globalKey.currentState;
//                    _state.showSnackBar(SnackBar(
//                      content: Text('Snack_globalkey'),
//                    ));
//                  },
//                  child: Text("globalKey"),
//                );
//              },
//            ),
          ],
        ),
      ),
    );
  }
}

