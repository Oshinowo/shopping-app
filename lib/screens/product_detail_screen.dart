import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopping_app/providers/cart_provider.dart';
import 'package:provider_shopping_app/screens/cart_screen.dart';

import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String id = 'product detail screen';

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    final cart = context.read<Cart>();
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: badges.Badge(
              badgeContent: Text(context.watch<Cart>().itemCount.toString()),
              badgeStyle: const badges.BadgeStyle(
                badgeColor: Colors.deepOrange,
              ),
              child: IconButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(CartScreen.id),
                  icon: const Icon(Icons.shopping_cart)),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 350,
            child: Image.network(
              loadedProduct.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            loadedProduct.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30.0,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              loadedProduct.description,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            padding: const EdgeInsets.only(
              bottom: 30.0,
            ),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                cart.addItem(
                    loadedProduct.id, loadedProduct.price, loadedProduct.title);
              },
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'ADD TO CART',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
