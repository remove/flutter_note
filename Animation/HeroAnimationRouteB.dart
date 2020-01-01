import 'package:flutter/material.dart';

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar",
        child: Image.asset("images/logo.png"),
      ),
    );
  }
}
