import 'package:get/get.dart';

import '../../../model/all_products/all_products.dart';

class WishlistController extends GetxController {
  RxInt quantity = 1.obs;

  final _wishlist = <Product>[].obs;

  List<Product> get wishlist => _wishlist.toList();

  void addToWishlist(Product product) {
    _wishlist.add(product);
  }

  void removeFromWishlist(Product product) {
    _wishlist.remove(product);
  }

  void clearWishlist() {
    _wishlist.clear();
  }

  bool isProductInWishlist(Product product) {
    return _wishlist.contains(product);
  }
}

class Wishlist {
  late final Product product;

  Wishlist({required this.product});
}
