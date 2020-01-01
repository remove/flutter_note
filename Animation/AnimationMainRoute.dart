import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Animation/AnimatedDecoratedBoxTest.dart';
import 'package:my_app/Animation/AnimatedSwitcherCounterRoute.dart';
import 'package:my_app/Animation/AnimatedWidgetsTest.dart';
import 'package:my_app/Animation/HeroAnimationRoute.dart';
import 'package:my_app/Animation/ScaleAnimationRoute.dart';
import 'package:my_app/Animation/StaggerRoute.dart';

class AnimationMainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              colorBrightness: Brightness.dark,
              color: Colors.pink,
              child: Text("基础动画"),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 500),
                        pageBuilder: (BuildContext context, Animation animation,
                            Animation sAnimation) {
                          return new FadeTransition(
                            opacity: animation,
                            child: ScaleAnimationRoute(),
                          );
                        }));
              },
            ),
            FlatButton(
              color: Colors.pink,
              colorBrightness: Brightness.dark,
              child: Text("Hero动画"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HeroAnimationRoute()));
              },
            ),
            FlatButton(
              color: Colors.pink,
              colorBrightness: Brightness.dark,
              child: Text("交织动画"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StaggerRoute()));
              },
            ),
            FlatButton(
              color: Colors.pink,
              colorBrightness: Brightness.dark,
              child: Text("切换动画"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AnimatedSwitcherCounterRoute()));
              },
            ),
            FlatButton(
              color: Colors.pink,
              colorBrightness: Brightness.dark,
              child: Text("过渡组件"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AnimatedDecoratedBoxTest()));
              },
            ),
            FlatButton(
              color: Colors.pink,
              colorBrightness: Brightness.dark,
              child: Text("过渡组件实例"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AnimatedWidgetsTest()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
