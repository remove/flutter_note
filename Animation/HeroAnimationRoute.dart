import 'package:flutter/material.dart';
import 'package:my_app/Animation/HeroAnimationRouteB.dart';

class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero"),),
      body: Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          child: Hero(
            tag: "avatar",
            child: ClipOval(
              child: Image.asset(
                "images/logo.png",
                width: 100,
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 600),
                pageBuilder: (BuildContext context, Animation animation,
                    Animation sAnimation) {
                  return new FadeTransition(
                    opacity: animation,
                    child: Scaffold(
                      appBar: AppBar(
                        title: Text("原图"),
                      ),
                      body: HeroAnimationRouteB(),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
