import 'package:flutter/material.dart';

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController _tabController;
  List tabs = ["python", "java", "dart"];

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String str = "ADSJLAKJGALKFJKLSAJDLKUGIODURFIOFUDSIOFJKS";
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
          indicatorColor: Colors.white,
        ),
        title: Text("Scaffold页面"),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.dashboard,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
          )
        ],
      ),
      drawer: new MyDrawer(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: (){
                _onItemTapped(0);
              },
            ),
            SizedBox(),
            IconButton(
              icon: Icon(Icons.business),
              onPressed:  (){
                _onItemTapped(1);
              }
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
//      bottomNavigationBar: BottomNavigationBar(
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.business), title: Text("Bussiness")),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.school), title: Text("School"))
//        ],
//        currentIndex: _selectedIndex,
//        onTap: _onItemTapped,
//      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((f) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              f,
              textScaleFactor: 5,
            ),
          );
        }).toList(),
      ),
      floatingActionButton: floatingButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget floatingButton = FloatingActionButton(
    backgroundColor: Colors.deepOrange,
    child: Icon(Icons.add),
    onPressed: () {},
  );
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.deepOrange,
              padding: const EdgeInsets.only(top: 58, bottom: 10),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ClipOval(
//                      clipper: MyClipper(),
                      child: Image.asset(
                        "images/logo.png",
                        width: 80,
                        height: 80,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    "Aero",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text("添加账户"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("管理账户"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(10, 30, 50, 50);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
