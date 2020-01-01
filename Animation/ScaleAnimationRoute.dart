import 'package:flutter/material.dart';

class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

//定义动画
  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation);
    animation.addStatusListener((s){
      if(s == AnimationStatus.completed){
        controller.reverse();
      } else if(s == AnimationStatus.dismissed){
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("基础动画"),),
      body: GrowTransition(
        child: Image.asset("images/avatar.png"),
        animation: animation,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

//渲染逻辑分离
class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
        animation: animation,
        //外部传入child
        builder: (BuildContext context, Widget c) {
          return new Container(
            height: animation.value,
            width: animation.value,
            //返回child
            child: c,
          );
        },
        //构建返回后的真child
        child: child,
      ),
    );
  }
}
