import 'package:flutter/cupertino.dart';
import 'package:flutter_app/providers/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> cartItems;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.cartItems,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> ordersList = [];

  List<OrderItem> get orders {
    return [...ordersList];
  }

  void addOrderItem(double totalAmt, List<CartItem> cartItems) {
    ordersList.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: totalAmt,
        cartItems: cartItems,
        dateTime: DateTime.now(),
      ),
    );

    notifyListeners();
  }
}
