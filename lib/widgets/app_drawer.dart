import 'package:flutter/material.dart';
import 'package:provider_shopping_app/screens/orders_screen.dart';
import 'package:provider_shopping_app/screens/products_overview_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text(
              'Hello Friend',
            ),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: const Icon(
              Icons.shop,
            ),
            title: const Text('Shop'),
            onTap: () => Navigator.of(context).pushReplacementNamed(
              ProductsOverviewScreen.id,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.shopping_cart,
            ),
            title: const Text('Orders'),
            onTap: () => Navigator.of(context).pushReplacementNamed(
              OrdersScreen.id,
            ),
          ),
        ],
      ),
    );
  }
}
