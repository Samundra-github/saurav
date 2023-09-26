// ignore_for_file: unnecessary_null_comparison

import 'package:get/get.dart';

import '../../../model/all_products/all_products.dart';

class CartController extends GetxController {
  RxInt quantity = 1.obs;

  RxInt totalQuantity = 0.obs;

  final _cartItems = <CartItem>[].obs;

  List<CartItem> get cartItems => _cartItems.toList();

  void addToCart(Product product, int quantity) {
    final existingCartItemIndex =
        _cartItems.indexWhere((item) => item.product.id == product.id);

    if (existingCartItemIndex != -1) {
      _cartItems[existingCartItemIndex].quantity += quantity;
    } else {
      final cartItem = CartItem(product: product, quantity: quantity);
      _cartItems.add(cartItem);
    }

    totalQuantity.value = calculateTotalQuantity();

    print('Cart Items: $_cartItems');
  }

  int calculateTotalQuantity() {
    int totalQuantity = 0;
    for (var item in _cartItems) {
      totalQuantity += item.quantity;
    }
    return totalQuantity;
  }

  void removeFromCart(CartItem cartItem) {
    _cartItems.remove(cartItem);
  }

  void clearCart() {
    _cartItems.clear();
    print("Cart is cleared");
    update();
  }

  void decreaseQuantity() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  void increaseQuantity() {
    quantity.value++;
  }
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}
