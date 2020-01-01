import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchAndCheckBox extends StatefulWidget {
  @override
  _SwitchAndCheckBox createState() => new _SwitchAndCheckBox();
}

class _SwitchAndCheckBox extends State<SwitchAndCheckBox> {
  bool _switchSelected = true;
  bool _checkboxA = false;
  bool _checkboxB = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("单选框和复选框"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Switch(
                  value: _switchSelected,
                  onChanged: (value) {
                    setState(() {
                      _switchSelected = value;
                      _checkboxA = false;
                      _checkboxB = false;
                    });
                  }),
              Checkbox(
                value: _checkboxA,
                activeColor: Colors.pinkAccent,
                tristate: true,
                onChanged: (value) {
                  setState(() {
                    _checkboxA = value;
                    _checkboxB = !value;
                  });
                },
              ),
              Checkbox(
                value: _checkboxB,
                activeColor: Colors.pinkAccent,
                tristate: true,
                onChanged: (value) {
                  setState(() {
                    _checkboxB = value;
                    _checkboxA = !value;
                  });
                },
              )
            ],
          ),
        ));
  }
}
