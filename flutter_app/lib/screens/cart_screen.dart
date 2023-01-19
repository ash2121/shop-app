import 'package:flutter/material.dart';
import 'package:flutter_app/providers/cart.dart';
import 'package:flutter_app/providers/orders.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart' as ci;

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final order = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    Chip(
                      label: Text(
                        'Rs ${cart.totalAmt()}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.purple,
                    ),
                    TextButton(
                      onPressed: () {
                        order.addOrderItem(
                          cart.totalAmt(),
                          cart.items.values.toList(),
                        );
                        cart.clearCart();
                      },
                      child: const Text(
                        'Order Now',
                      ),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                var curr = cart.items.values.toList()[index];
                return ci.CartItem(
                  productId: cart.items.keys.toList()[index],
                  id: curr.id,
                  price: curr.price,
                  quantity: curr.quantity,
                  title: curr.title,
                );
              },
              itemCount: cart.itemCount(),
            ),
          )
        ],
      ),
    );
  }
}
