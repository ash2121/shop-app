import 'package:flutter/material.dart';
import 'package:flutter_app/providers/cart.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.id,
    required this.price,
    required this.title,
    required this.quantity,
    required this.productId,
  }) : super(key: key);

  final String id;
  final double price;
  final String title;
  final int quantity;
  final String productId;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 6,
        ),
        alignment: Alignment.centerRight,
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Icon(
            Icons.delete,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
      onDismissed: (direction) {
        cart.removeItem(id);
      },
      direction: DismissDirection.endToStart,
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 6,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purple,
              child: FittedBox(
                child: Text(
                  'Rs. $price',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total : Rs.${price * quantity}'),
            trailing: Text('$quantity X'),
          ),
        ),
      ),
    );
  }
}
