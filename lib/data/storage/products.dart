import 'dart:math';

import 'package:ecommerce_app/constants/image_consants.dart';
import 'package:ecommerce_app/models/product_model.dart';

class Products {
  static final List<String> _productNames = [
    'Unisex Straw Hat',
    'Design Orange Vase',
    'Women Leather Bag',
    'Retro Desk Clock',
    'Design Ceramic Cup',
    'Wireless Headphone',
    'Unisex Straw Hat',
    'Design Orange Vase',
  ];

  // ignore: non_constant_identifier_names
  static List<ProductModel> PRODUCTS = _generateProducts();

  static List<ProductModel> _generateProducts() {
    return _productNames.asMap().entries.map((entry) {
      final index = entry.key;
      final productName = entry.value;
      return ProductModel(
        id: DateTime(2024, 8, index + 1).millisecondsSinceEpoch,
        category: 'Leather Women Bag',
        name: productName,
        viewCount: 15 * (index + 1) * Random().nextInt(3),
        details: '50 Strips in a box for Accu-check Active Glucometer Machine',
        price: 112,
        image: ImageConstants.productImages[index],
        rating: Random().nextDouble() * 5,
        totalReviews: 715,
      );
    }).toList();
  }

  static ProductModel getProductById(int id) {
    return PRODUCTS.firstWhere((element) => element.id == id);
  }

  static int getProductIndexById(int id) {
    return PRODUCTS.indexWhere((element) => element.id == id);
  }

  //update
  static void updateProduct(ProductModel product) {
    final index = getProductIndexById(product.id);
    PRODUCTS[index] = product;
  }

  static void switchIsFavouriteValue(ProductModel product) {
    // print('${product.id} ${product.isFavorite}');
    final index = getProductIndexById(product.id);
    PRODUCTS[index] = product.copyWith(isFavorite: !product.isFavorite);
  }
}
