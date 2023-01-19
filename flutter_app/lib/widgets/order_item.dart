import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Rs. ${widget.order.amount}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: isExpanded
                  ? Icon(Icons.expand_less)
                  : Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          if (isExpanded)
            Container(
              height: min(180, widget.order.cartItems.length * 20.0 + 30),
              child: ListView(
                  children: widget.order.cartItems
                      .map((prod) => Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  prod.title,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  '${prod.price} X ${prod.quantity}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList()),
            )
        ],
      ),
    );
  }
}
