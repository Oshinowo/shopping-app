import 'package:flutter/material.dart';
import 'package:provider_shopping_app/utils/products_list.dart';

import 'product_provider.dart';

class Products with ChangeNotifier {
  final List<Product> _items = loadedProducts;

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
