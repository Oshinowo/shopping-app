import 'package:flutter/foundation.dart';
import 'package:provider_shopping_app/models/product.dart';

class Product extends ProductModel with ChangeNotifier {
  Product({required String id, required String title, required String description, required double price, required String imageUrl}) : super(id: id, title: title, description: description, price: price, imageUrl: imageUrl);

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
