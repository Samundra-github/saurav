import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/api.dart';
import '../../../resource/constraints/height_width.dart';
import '../../../resource/theme/colors.dart';
import '../../../resource/utils/utils.dart';
import '../../../view_model/controller/product/wishlist_controller.dart';
import '../product_details.dart';

class WishlistView extends StatefulWidget {
  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  final WishlistController wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: searchBackground,
      appBar: AppBar(
        backgroundColor: searchBackground,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/bar-sort.png'),
            ),
            addHorizontalSpace(10),
            const Text("My Cart")
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: 20,
            ),
            child: Icon(
              Icons.search_rounded,
              size: 30,
            ),
          )
        ],
      ),
      body: Obx(
        () => GridView.builder(
          itemCount: wishlistController.wishlist.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            mainAxisExtent: 250,
          ),
          itemBuilder: (context, index) {
            final wishlistItem = wishlistController.wishlist[index];

            return InkWell(
              onTap: () {
                Get.to(() => DetailProductView(product: wishlistItem));
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  right: 15,
                  left: 15,
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                    right: 20,
                    left: 20,
                    top: 20,
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 100,
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
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  if (wishlistController
                                      .isProductInWishlist(wishlistItem)) {
                                    wishlistController
                                        .removeFromWishlist(wishlistItem);
                                    Utils.snackBar(
                                      "Wishlist",
                                      "Product Successfully removed from Wishlist",
                                    );
                                  } else {
                                    wishlistController
                                        .addToWishlist(wishlistItem);
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
                                              .isProductInWishlist(
                                                  wishlistItem);

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
                      addHorizontalSpace(20),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              wishlistItem.name.toString(),
                              style: textTheme.bodyLarge,
                            ),
                            addVerticalSpace(Get.height * 0.015),
                            Text(
                              "Rs${wishlistItem.price.toStringAsFixed(2)}",
                              style: textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
