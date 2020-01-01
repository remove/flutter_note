import 'package:flutter/material.dart';
import 'package:my_app/model/CountModel.dart';
import 'package:provider/provider.dart';

class DataSharePageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("页面2刷新了");
    return Scaffold(
      appBar: AppBar(
        title: Text("数据页面2"),
      ),
      body: Consumer2(
          builder: (context, CountModel counter, int textSize, _) => Center(
                child: Text(
                  "Value: ${counter.value}",
                  style: TextStyle(fontSize: textSize.toDouble()),
                ),
              )),
      //使用Consumer读取数据,虽然Consumer内部使用Provider.of读取数据，
      // 但是只刷新需要刷新的组件甚至可以设置不刷新的子组件，提升性能
      floatingActionButton: Consumer(
        builder: (context, CountModel counter, icon) => FloatingActionButton(
          onPressed: counter.increment,
          child: icon,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
