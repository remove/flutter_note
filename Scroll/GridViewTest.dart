import 'package:flutter/material.dart';

class GirdViewTest extends StatefulWidget {
  @override
  _GirdViewTestState createState() => _GirdViewTestState();
}

class _GirdViewTestState extends State<GirdViewTest> {
  List<IconData> _icons = [];

  @override
  void initState() {
    _retrieveIcons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("网格列表"),
        ),
        body: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: _icons.length,
            itemBuilder: (context, index) {
              if (index == _icons.length - 1 && _icons.length < 200) {
                _retrieveIcons();
              }
              return Icon(_icons[index]);
            }));
//      body: GridView.count(
    //根据子元素个数决定
//        crossAxisCount: 3,
//        childAspectRatio: 1,
//        children: <Widget>[
//          Icon(Icons.ac_unit),
//          Icon(Icons.ac_unit),
//          Icon(Icons.ac_unit),
//          Icon(Icons.ac_unit),
//          Icon(Icons.ac_unit),
//          Icon(Icons.ac_unit),
//          Icon(Icons.ac_unit),
//          Icon(Icons.ac_unit),
//        ],
//      ),
  }

  void _retrieveIcons() {
    Future.delayed(Duration(seconds: 1)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.four_k,
          Icons.add,
          Icons.account_box,
          Icons.four_k,
          Icons.accessible_forward,
          Icons.accessible,
        ]);
      });
    });
  }
}
