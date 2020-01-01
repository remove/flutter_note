import 'package:flutter/material.dart';

class ScrollControllerTestRoute extends StatefulWidget {
  @override
  _ScrollControllerTestRouteState createState() =>
      _ScrollControllerTestRouteState();
}

class _ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {
  ScrollController _controller = new ScrollController();
  bool showToTopButton = false;
  String _progress = "0%";

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 1000 && showToTopButton) {
        setState(() {
          showToTopButton = false;
        });
      } else if (_controller.offset >= 1000 && !showToTopButton) {
        setState(() {
          showToTopButton = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动控制"),
      ),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            print("BottomEdge: ${notification.metrics.extentAfter == 0}");
            return true;
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                controller: _controller,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    color: Colors.lightBlue[10*index]
                  );
                },
                //子元件总数
                itemCount: 100,
                //列表高度固定
                itemExtent: 50,
              ),
              CircleAvatar(
                radius: 30,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              )
            ],
          ),
        ),
//        child: ListView.builder(
//          itemCount: 100,
//          itemExtent: 50,
//          controller: _controller,
//          itemBuilder: (BuildContext context, int index) {
//            return ListTile(
//              title: Text("$index"),
//            );
//          },
//        ),
      ),
      floatingActionButton: !showToTopButton
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(.0,
                    duration: Duration(seconds: 2), curve: Curves.ease);
              },
            ),
    );
  }
}
