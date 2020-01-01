import 'package:flutter/material.dart';

class FormRoute extends StatefulWidget {
  @override
  _FormRouteState createState() => _FormRouteState();
}

class _FormRouteState extends State<FormRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pasController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("表单和校验"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _unameController,
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名和邮箱",
                    icon: Icon(Icons.person)),
                validator: (v) {
                  return v.trim().length > 0 ? null : "用户名不能为空";
                },
              ),
              TextFormField(
                  controller: _pasController,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "输入您的密码",
                      icon: Icon(Icons.lock)),
                  obscureText: true,
                  validator: (v) {
                    return v.trim().length > 5 ? null : "密码不能少于6位";
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Builder(
                      builder: (context) {
                        return RaisedButton(
                          padding: EdgeInsets.all(15),
                          child: Text("登陆"),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            if (Form.of(context).validate()) {
                              print(
                                  _pasController.text + _unameController.text);
                            }
                          },
                        );
                      },
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
