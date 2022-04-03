import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider_shopping_app/models/order.dart' as model;

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.orderItem}) : super(key: key);

  final model.OrderItem orderItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: ListTile(
        title: Text('\$${orderItem.amount}'),
        subtitle: Text(
          DateFormat('dd-MM-yyyy hh:mm').format(orderItem.dateTime),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.expand_more),
        ),
      ),
    );
  }
}
