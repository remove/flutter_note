import 'package:flutter/material.dart';

class CustomScrollViewTestRoute extends StatefulWidget {
  @override
  _CustomScrollViewTestRouteState createState() =>
      _CustomScrollViewTestRouteState();
}

class _CustomScrollViewTestRouteState extends State<CustomScrollViewTestRoute> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Aero"),
              background: Image.asset(
                "images/colors.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: new SliverGrid(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 4),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text("grid tiem $index"),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          SliverFixedExtentList(
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: new Text("list Item $index"),
                  );
                },
                childCount: 50,
              ),
              itemExtent: 50),
        ],
      ),
    );
  }
}
