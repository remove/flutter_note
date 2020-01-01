import 'package:flutter/material.dart';
import 'package:my_app/Animation/MySlideTransition.dart';

class AnimatedSwitcherCounterRoute extends StatefulWidget {
  const AnimatedSwitcherCounterRoute({Key key}) : super(key: key);

  @override
  _AnimatedSwitcherCounterRouteState createState() =>
      _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState
    extends State<AnimatedSwitcherCounterRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                var tween = Tween<Offset>(begin: Offset(1,0), end: Offset(0,0));
                return MySlideTransition(
                  position: tween.animate(animation),
                  child: child,
                );
              },
              child: Text(
                "$_count",
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            FlatButton(
              child: const Text("+1"),
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
