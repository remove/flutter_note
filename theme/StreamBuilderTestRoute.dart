import 'package:flutter/material.dart';

class StreamBuilderTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: counter(),
              builder: (context, snapshot) {
                if (snapshot.hasError) return Text("错误：${snapshot.error}");
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text("没有Stream");
                  case ConnectionState.waiting:
                    return Text("等待数据");
                  case ConnectionState.active:
                    return Text("active: ${snapshot.data}");
                  case ConnectionState.done:
                    return Text("Stream已关闭");
                }
                return null;
              },
            )
          ],
        ),
      ),
    );
  }

  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 1), (i) {
      if(i<10){
        return i;
      }
      return null;
    });
  }
}
