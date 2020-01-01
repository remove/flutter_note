import 'package:flutter/material.dart';
import 'package:my_app/Function/Consumer.dart';
import 'package:my_app/Function/InheritedProvider.dart';
import 'package:my_app/model/CartModel.dart';
import 'package:my_app/model/Item.dart';

class ProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Builder(builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ConsumerTest<CartModel>(
                    builder: (context, cart) => Text("总价: ${cart.totalPrice}")),
                Builder(builder: (context) {
                  print("RaisedButton build"); //在后面优化部分会用到
                  return RaisedButton(
                    child: Text("添加商品"),
                    onPressed: () {
                      //给购物车中添加商品，添加后总价会更新
                      ChangeNotifierProvider.of<CartModel>(context, listen: false)
                          .add(Item(20.0, 1));
                    },
                  );
                }),
              ],
            );
          }),
        ),
      ),
    );
  }
}
