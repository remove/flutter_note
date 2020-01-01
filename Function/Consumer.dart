import 'package:flutter/material.dart';
import 'package:my_app/Function/InheritedProvider.dart';

class ConsumerTest<T> extends StatelessWidget {
  ConsumerTest({
    Key key,
    @required this.builder,
    this.child,
  })  : assert(builder != null),
        super(key: key);

  final Widget child;
  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotifierProvider.of(context),
    );
  }
}
