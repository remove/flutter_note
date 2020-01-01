import 'package:flutter/material.dart';
import 'package:my_app/Function/DataSharePageTwo.dart';
import 'package:my_app/model/CountModel.dart';
import 'package:provider/provider.dart';

class DataSharePageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("页面1刷新了");
    //使用Provider.of<T>读取数据,用这个无法控制不刷新的组件
    final _counter = Provider.of<CountModel>(context);
    final textSize = Provider.of<int>(context).toDouble();
    return Scaffold(
      appBar: AppBar(
        title: Text("数据页面1"),
      ),
      body: Center(
        child: Text(
          "Value: ${_counter.value}",
          style: TextStyle(
            fontSize: textSize,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DataSharePageTwo()));
        },
        child: Icon(Icons.call_missed_outgoing),
      ),
    );
  }
}
