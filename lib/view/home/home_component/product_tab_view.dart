import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gokyo/resource/theme/colors.dart';
import 'package:gokyo/view/shop/product_details.dart';
import 'package:gokyo/view_model/controller/home/product_controller.dart';

import '../../../model/all_products/all_products.dart';
import '../../../resource/utils/utils.dart';
import '../../../view_model/controller/product/wishlist_controller.dart';

// Import the ProductController

class ProductTabView extends StatefulWidget {
  const ProductTabView({super.key});

  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView> {
  // Category

  int current = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    final ProductController productController = Get.find<ProductController>();
    try {
      await productController.fetchAllProducts();
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print('Failed to fetch products: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> productList =
        GetStorage().read<List<dynamic>>('products') ?? [];
    final List<Product> categoryProducts =
        productList.map((json) => Product.fromJson(json)).toList();
    List<String> categories = ['All'];
    for (var product in categoryProducts) {
      if (!categories.contains(product.category)) {
        categories.add(product.category);
      }
    }

    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : SizedBox(
            height: 600,
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tab View
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.only(
                              right: 20, left: 20, top: 5, bottom: 5),
                          // width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: textColor, width: 2),
                            borderRadius: BorderRadius.circular(30),
                            color: current == index ? blackColor : whiteColor,
                          ),
                          child: Center(
                            child: Text(
                              categories[index].toString(),
                              style: TextStyle(
                                color:
                                    current == index ? whiteColor : blackColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                TabContent(
                  categoryProducts: categoryProducts,
                  current: current,
                  categories: categories,
                ),
              ],
            ),
          );
  }
}

class TabContent extends StatelessWidget {
  const TabContent({
    Key? key,
    required this.categoryProducts,
    required this.current,
    required this.categories,
  }) : super(key: key);

  final List<Product> categoryProducts;
  final int current;
  final List categories;

  @override
  Widget build(BuildContext context) {
    final WishlistController wishlistController = Get.put(WishlistController());

    TextTheme textTheme = Theme.of(context).textTheme;
    final filteredProducts = current == 0
        ? categoryProducts
        : categoryProducts
            .where((product) => product.category == categories[current])
            .toList();

    return Container(
      color: whiteColor,
      height: 400,
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: filteredProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                mainAxisExtent: 250,
              ),
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return InkWell(
                  onTap: () {
                    Get.to(() => DetailProductView(product: product));
                  },
                  child: Card(
                    elevation: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: searchBackground,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Stack(
                            children: [
                              // Image
                              Image.asset(
                                'assets/images/product-1-1.png',
                                height: 150,
                                width: 400,
                              ),
                              // "Add to Wishlist" Icon with background
                              Positioned(
                                top: 10,
                                right: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    if (wishlistController
                                        .isProductInWishlist(product)) {
                                      wishlistController
                                          .removeFromWishlist(product);
                                      Utils.snackBar(
                                        "Wishlist",
                                        "Product Successfully removed from Wishlist",
                                      );
                                    } else {
                                      wishlistController.addToWishlist(product);
                                      Utils.snackBar(
                                        "Wishlist",
                                        "Product Successfully added to Wishlist",
                                      );
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                      color: blackColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Obx(
                                      () {
                                        final bool isInWishlist =
                                            wishlistController
                                                .isProductInWishlist(product);

                                        return Row(
                                          children: [
                                            Icon(
                                              isInWishlist
                                                  ? Icons.favorite
                                                  : Icons
                                                      .favorite_border_outlined,
                                              color: isInWishlist
                                                  ? whiteColor
                                                  : whiteColor,
                                              size: 20,
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          product.name,
                          style: textTheme.bodyLarge,
                        ),
                        Text(
                          product.price.toString(),
                          style: textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
