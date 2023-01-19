import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/edit_product.dart';
import 'package:flutter_app/screens/product_detail_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case ProductDetailScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => ProductDetailScreen(),
        settings: routeSettings,
      );
    case EditProductScreen.routeName:
      return MaterialPageRoute(builder: (context) => const EditProductScreen());
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text("Error : Page does not exist"),
          ),
        ),
      );
  }
}
