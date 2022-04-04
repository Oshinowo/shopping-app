import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider_shopping_app/models/order.dart' as model;

class OrderItem extends StatefulWidget {
  const OrderItem({Key? key, required this.orderItem}) : super(key: key);

  final model.OrderItem orderItem;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.orderItem.amount}'),
            subtitle: Text(
              DateFormat('dd-MM-yyyy hh:mm').format(widget.orderItem.dateTime),
            ),
            trailing: IconButton(
              onPressed: () => setState(() {
                _isExpanded = !_isExpanded;
              }),
              icon: _isExpanded
                  ? const Icon(Icons.expand_less)
                  : const Icon(Icons.expand_more),
            ),
          ),
          if (_isExpanded)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0,
              ),
              height: min(widget.orderItem.products.length * 20 + 10, 100),
              child: ListView(
                children: widget.orderItem.products
                    .map(
                      (prod) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(prod.title),
                          Text('${prod.quantity}x \$${prod.price}')
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
