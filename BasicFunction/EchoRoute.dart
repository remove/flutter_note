import 'package:flutter/cupertino.dart';

class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    print(args);
    return null;
  }
}
