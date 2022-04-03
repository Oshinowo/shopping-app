import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopping_app/providers/order_provider.dart';
import 'package:provider_shopping_app/widgets/app_drawer.dart';
import 'package:provider_shopping_app/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const String id = 'orders screen';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = context.watch<Order>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemBuilder: (context, i) => OrderItem(
          orderItem: orderData.orders[i],
        ),
        itemCount: orderData.orders.length,
      ),
    );
  }
}
