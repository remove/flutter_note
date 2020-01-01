import 'package:flutter/material.dart';

class MyRichText extends StatefulWidget {
  MyRichText({
    Key key,
    this.text,
    this.linkStyle,
  }) : super(key: key);

  final String text;
  final TextStyle linkStyle;

  @override
  _MyRichTextState createState() => _MyRichTextState();
}

class _MyRichTextState extends State<MyRichText> {
  TextSpan _textSpan;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: _textSpan,
    );
  }

  TextSpan parseText(String text) {}

  @override
  void initState() {
    _textSpan = parseText(widget.text);
    super.initState();
  }

  //依赖State缓存状态需要注意组件更新的时候是否需要同步信息
  @override
  void didUpdateWidget(MyRichText oldWidget) {
    if (widget.text != oldWidget.text) {
      _textSpan = parseText(widget.text);
    }
    super.didUpdateWidget(oldWidget);
  }
}
