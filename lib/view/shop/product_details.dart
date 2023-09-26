import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gokyo/resource/theme/colors.dart';
import 'package:gokyo/view/shop/widget/expandable.dart';

import '../../model/all_products/all_products.dart';
import '../../resource/constraints/height_width.dart';
import '../../resource/utils/utils.dart';
import '../../view_model/controller/product/cart_controller.dart';
import '../../view_model/controller/product/wishlist_controller.dart';

class DetailProductView extends StatefulWidget {
  final Product product;

  DetailProductView({required this.product});

  @override
  State<DetailProductView> createState() => _DetailProductViewState();
}

class _DetailProductViewState extends State<DetailProductView> {
  final WishlistController wishlistController = Get.put(WishlistController());
  final CartController cartController = Get.put(CartController());

  String selectedImage = 'assets/images/product-1-1.png';
  List<String> allImages = [
    'assets/images/product-1-1.png',
    'assets/images/product-1-2.jpg',
    'assets/images/product-2-1.jpg'
  ];

  int currentPage = 0; // Track the current page position
  PageController _pageController = PageController();
  List<String> productReviews = [];
  TextEditingController reviewController = TextEditingController();
  double userRating = 0.0;
  // final _localStorage = GetStorage();

  @override
  void initState() {
    super.initState();
    // Retrieve the saved reviews from GetStorage
    // List<String>? savedReviews =
    //     _localStorage.read<List<String>>(widget.product.id.toString());
    // if (savedReviews != null) {
    //   productReviews = savedReviews;
    // }

    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: searchBackground,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: photoBackground,
      //   // title: Text(widget.product.name.toString()),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 15,
            left: 15,
            bottom: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              addVerticalSpace(Get.height * 0.04),
              SizedBox(
                child: BackButton(
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              SizedBox(
                height: Get.height * 0.4,
                width: double.maxFinite,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: allImages.length,
                        onPageChanged: (index) {
                          setState(() {
                            currentPage = index;
                            selectedImage = allImages[currentPage];
                          });
                        },
                        itemBuilder: (context, index) {
                          // final image = allImages[index];
                          return Image.asset(
                            'assets/images/product-1-1.png',
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    addVerticalSpace(Get.height * 0.02),
                    allImages.isNotEmpty
                        ? DotsIndicator(
                            dotsCount: allImages.length,
                            position: currentPage,
                            decorator: DotsDecorator(
                              activeColor: blackColor,
                              size: const Size.square(10.0),
                              activeSize: const Size(34.0, 10.0),
                              spacing:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              addVerticalSpace(Get.height * 0.030),
              Container(
                padding: const EdgeInsets.only(
                    bottom: 30, right: 15, left: 15, top: 30),
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.name.toUpperCase().toString(),
                          style: textTheme.headlineSmall,
                        ),
                        InkWell(
                          mouseCursor: MouseCursor.defer,
                          onTap: () {
                            if (wishlistController
                                .isProductInWishlist(widget.product)) {
                              wishlistController
                                  .removeFromWishlist(widget.product);
                              Utils.snackBar(
                                "Wishlist",
                                "Product Successfully removed from Wishlist",
                              );
                            } else {
                              wishlistController.addToWishlist(widget.product);
                              Utils.snackBar(
                                "Wishlist",
                                "Product Successfully added to Wishlist",
                              );
                            }
                          },
                          child: Obx(
                            () {
                              final bool isInWishlist = wishlistController
                                  .isProductInWishlist(widget.product);

                              return Row(
                                children: [
                                  Icon(
                                    isInWishlist
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color: isInWishlist ? Colors.red : null,
                                  ),
                                  addHorizontalSpace(5),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    addVerticalSpace(Get.height * 0.025),
                    ExpandableDescription(
                        description: widget.product.description.toString()),
                    addVerticalSpace(Get.height * 0.025),
                    if (widget.product.quantity == 0)
                      const Text(
                        'Out of Stock',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      )
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ... (existing code)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Quantity:',
                                style: textTheme.bodyLarge,
                              ),
                              addVerticalSpace(Get.width * 0.025),
                              Obx(
                                () => SizedBox(
                                  width: 150,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed:
                                            (cartController.quantity.value > 1)
                                                ? () => cartController
                                                    .decreaseQuantity()
                                                : null,
                                      ),
                                      addHorizontalSpace(Get.width * 0.05),
                                      Text(
                                        cartController.quantity.toString(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      addHorizontalSpace(Get.width * 0.05),
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () =>
                                            cartController.increaseQuantity(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          addVerticalSpace(Get.height * 0.021),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total price',
                                    style: textTheme.bodyMedium,
                                  ),
                                  Text(
                                    'RS. ${widget.product.price}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: textColor,
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: widget.product.quantity == 0
                                    ? null
                                    : () {
                                        cartController.addToCart(widget.product,
                                            cartController.quantity.value);
                                        Utils.snackBar(
                                          'Cart',
                                          '${cartController.quantity.value} ${widget.product.name} added to cart',
                                        );
                                      },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.add_shopping_cart_outlined,
                                        color: borderTextFormField,
                                      ),
                                      addHorizontalSpace(0.02),
                                      const Text(
                                        'Add to Cart',
                                        style: TextStyle(
                                            color: borderTextFormField),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    addVerticalSpace(Get.height * 0.05),
                    // ProductReviews(
                    //   productId: widget.product.id,
                    // ),
                    // addVerticalSpace(Get.height * 0.02),
                    // TextFormField(
                    //   decoration: const InputDecoration(
                    //     floatingLabelBehavior: FloatingLabelBehavior.never,
                    //     labelText: 'Add Your Review',
                    //   ),
                    //   controller: reviewController,
                    // ),
                    // addVerticalSpace(Get.height * 0.02),
                    // Center(
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       String userReview = reviewController.text;
                    //       setState(() {
                    //         final productId = widget.product.id.toString();
                    //         List<String>? existingReviews =
                    //             GetStorage().read<List<String>>(productId);
                    //         existingReviews ??= [];
                    //         existingReviews.add(userReview);
                    //         GetStorage().write(productId, existingReviews);

                    //         reviewController.clear();
                    //         productReviews = existingReviews;
                    //       });
                    //     },
                    //     child: const Text('Submit Review'),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
