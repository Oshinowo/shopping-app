import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopping_app/providers/cart_provider.dart';
import 'package:provider_shopping_app/providers/order_provider.dart';
import 'package:provider_shopping_app/screens/cart_screen.dart';
import 'package:provider_shopping_app/screens/product_detail_screen.dart';
import 'package:provider_shopping_app/screens/products_overview_screen.dart';
import 'package:provider_shopping_app/providers/products_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Products()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => Order()),
      ],
      child: const ShoppingApp(),
    ),
  );
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.purple,
      ),
      initialRoute: ProductsOverviewScreen.id,
      routes: {
        ProductsOverviewScreen.id: (context) => const ProductsOverviewScreen(),
        ProductDetailScreen.id: (context) => const ProductDetailScreen(),
        CartScreen.id: (context) => const CartScreen(),
      },
    );
  }
}
