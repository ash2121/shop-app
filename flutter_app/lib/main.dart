import 'package:flutter/material.dart';
import 'package:flutter_app/providers/cart.dart';
import 'package:flutter_app/providers/orders.dart';
import 'package:flutter_app/providers/products.dart';
import 'package:flutter_app/screens/cart_screen.dart';
import 'package:flutter_app/screens/order_screen.dart';
import 'package:flutter_app/screens/product_detail_screen.dart';
import 'package:flutter_app/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
                .copyWith(secondary: Colors.deepOrange),
          ),
          routes: {
            ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
            CartScreen.routeName: (context) => const CartScreen(),
            ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
            OrdersScreen.routeName: (context) => OrdersScreen(),
          },
          home: const ProductsOverviewScreen()),
    );
  }
}
