import 'package:flutter/cupertino.dart';
//构建过渡动画组件
//继承ImplicitlyAnimatedWidget类
class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {
  AnimatedDecoratedBox({
    Key key,
    @required this.decoration,
    this.child,
    Curve curve = Curves.linear,//动画曲线
    @required Duration duration,//动画执行时常
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
        );
  final BoxDecoration decoration;
  final Widget child;

  //实现ImplicitAnimatedWidgetState
  @override
  _AnimatedDecoratedBoxState createState() {
    return _AnimatedDecoratedBoxState();
  }
}

//继承AnimatedWidgetBaseState,因为AnimatedWidgetBaseState继承于ImplicitAnimatedWidgetState
//所以实现了AnimatedDecoratedBox的方法
class _AnimatedDecoratedBoxState
    extends AnimatedWidgetBaseState<AnimatedDecoratedBox> {
  DecorationTween _decoration;//定义Tween

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decoration.evaluate(animation),//使用Tween的动画构建
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    //在需要更新Tween时，基类会调用此方法
    _decoration = visitor(_decoration, widget.decoration,
        (value) => DecorationTween(begin: value));
  }
}
