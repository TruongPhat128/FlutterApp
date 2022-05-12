import 'package:foodnowapp/cart/components/body.dart';
import 'products.dart';

class Cart {
  static List<CartItem> cart = [];

  void addProductToCart(Products product, int quantity) {
    cart.add(CartItem(product: product, quantity: quantity));
  }

  List<CartItem> getCart() {
    return cart;
  }
}
