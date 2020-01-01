import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextAndFormRoute extends StatefulWidget {
  _TextAndFormState createState() => new _TextAndFormState();
}

class _TextAndFormState extends State<TextAndFormRoute> {
  TextEditingController _userNameController = TextEditingController();
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    _userNameController.text = "hello world";
    _userNameController.selection = TextSelection(
        baseOffset: 2, extentOffset: _userNameController.text.length);
    focusNode1.addListener(() {
      print(focusNode1.hasFocus);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("输入框与表单")),
      body: Center(
        child: Theme(
          data: Theme.of(context).copyWith(
              hintColor: Colors.green,
              inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(color: Colors.purple),
                  hintStyle:
                      TextStyle(color: Colors.amberAccent, fontSize: 14))),
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                focusNode: focusNode1,
                controller: _userNameController,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelText: "用户名",
                    hintText: "输入用户名棒棒！",
                    prefixIcon: Icon(Icons.person)),
                onChanged: (v) {
                  print("onChange: $v");
                },
              ),
              TextField(
                focusNode: focusNode2,
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "输入密码棒棒！",
                    prefixIcon: Icon(Icons.lock)),
                obscureText: true,
              ),
              Column(
                children: <Widget>[
                  RaisedButton(
                      child: Text("移动焦点"),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(focusNode2);
                      }),
                  RaisedButton(
                    child: Text("隐藏键盘"),
                    onPressed: () {
                      focusNode1.unfocus();
                      focusNode2.unfocus();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
