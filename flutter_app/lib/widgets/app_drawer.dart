import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/screens/order_screen.dart';
import 'package:flutter_app/screens/products_overview_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: Text('Welcome'),
          automaticallyImplyLeading: false,
        ),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text('Shop'),
          onTap: () =>
              Navigator.of(context).pushNamed(ProductsOverviewScreen.routeName),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text('Orders'),
          onTap: () => Navigator.of(context).pushNamed(OrdersScreen.routeName),
        ),
        Divider(),
      ]),
    );
  }
}
