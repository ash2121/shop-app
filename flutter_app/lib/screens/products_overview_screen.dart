import 'package:flutter/material.dart';
import 'package:flutter_app/providers/cart.dart';
import 'package:flutter_app/screens/cart_screen.dart';
import 'package:flutter_app/widgets/app_drawer.dart';
import 'package:flutter_app/widgets/badge.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';

enum FilterOptions {
  favourites,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {
  static const routeName = '/product-overview-screen';

  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showOnlyFav = false;
  @override
  Widget build(BuildContext context) {
    // final productsData = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MyShop",
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.more_vert,
            ),
            onSelected: (FilterOptions value) {
              setState(() {
                if (value == FilterOptions.favourites) {
                  _showOnlyFav = true;
                } else {
                  _showOnlyFav = false;
                }
              });
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.favourites,
                child: Text("Only favourites"),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text('Show All'),
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              value: cart.itemCount().toString(),
              child: ch!,
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart_sharp),
              onPressed: () =>
                  Navigator.of(context).pushNamed(CartScreen.routeName),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(
        showfavs: _showOnlyFav,
      ),
    );
  }
}
