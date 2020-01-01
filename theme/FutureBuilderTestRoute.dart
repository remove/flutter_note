import 'package:flutter/material.dart';

class FutureBuilderTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("异步UI更新"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //FutureBuilder构建，输入future异步任务
            FutureBuilder(
              future: mockNetWordData(),
              //snapshot会包含当前异步任务的状态信息和结果信息
              builder: (context, snapshot) {
                //connectionState获取异步任务状态信息
                //ConnectionState有四个状态：
//                ConnectionState {
//                  /// 当前没有异步任务，比如[FutureBuilder]的[future]为null时
//                  none,
//
//                /// 异步任务处于等待状态
//                waiting,
//
//                /// Stream处于激活状态（流上已经有数据传递了），对于FutureBuilder没有该状态。
//                active,
//
//                /// 异步任务已经终止.
//                done,
//                }
              //ConnectionState.active 只会在StreamBuilder中出现
                if (snapshot.connectionState == ConnectionState.done) {
                  //如果出错
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else {
                    //成功便返回数据
                    return Text("${snapshot.data}");
                  }
                } else {
                  //如果还没完成限制圆圈加载
                  return CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Future<String> mockNetWordData() async {
    return Future.delayed(Duration(seconds: 2), () => "我是模拟数据");
  }
}
