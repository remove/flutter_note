import 'package:flutter/material.dart';

class LinerProgress extends StatefulWidget {
  @override
  _LinerProgressState createState() => _LinerProgressState();
}

class _LinerProgressState extends State<LinerProgress>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("进度指示器"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: ColorTween(begin: Colors.grey, end: Colors.pink)
                    .animate(_animationController),
                value: _animationController.value,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 30,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(Colors.pink),
                    value: .5,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(Colors.pink),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
