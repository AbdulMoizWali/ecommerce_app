import 'package:ecommerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  static final List<CartProduct> cartProducts = [];

  void addCartItem(CartProduct item) {
    cartProducts.add(item);
  }

  void updateCartItem(CartProduct item) {
    final index = cartProducts.indexWhere((element) => element == item);
    cartProducts[index] = item;
  }

  CartProduct getCartItemFromProduct(ProductModel product) {
    return cartProducts.firstWhere((element) => element.product == product);
  }

  void removeCartItem(CartProduct item) {
    cartProducts.remove(item);
  }

  @override
  List<Object?> get props => [cartProducts];
}

class CartProduct extends Equatable {
  final ProductModel product;
  final int quantity;
  final DateTime addedAt;

  const CartProduct({
    required this.product,
    required this.quantity,
    required this.addedAt,
  });

  @override
  List<Object?> get props => [
        product,
        quantity,
        addedAt,
      ];
}
