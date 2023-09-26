import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gokyo/resource/theme/colors.dart';
import 'package:gokyo/view/shop/view/widget/bottomsheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/api/api.dart';
import '../../../resource/constraints/height_width.dart';
import '../../../resource/routes/routes_name.dart';
import '../../../resource/utils/utils.dart';
import '../../../view_model/controller/product/cart_controller.dart';
import 'checkout_view.dart';

class CartView extends StatefulWidget {
  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final CartController cartController = Get.put(CartController());
  final List<int> quantities = [];

  @override
  void initState() {
    super.initState();

    quantities.addAll(List.generate(cartController.cartItems.length,
        (index) => cartController.cartItems[index].quantity));
  }

  void increaseQuantity(int index) {
    setState(() {
      quantities[index] = quantities[index] + 1;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (quantities[index] > 1) {
        quantities[index] = quantities[index] - 1;
      }
    });
  }

  Future<bool> _checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    return token != null;
  }

  Future<void> proceedToCheckout() async {
    final List<Map<String, dynamic>> products = [];
    int totalAmount = 0;

    for (int i = 0; i < cartController.cartItems.length; i++) {
      final cartItem = cartController.cartItems[i];
      final quantity = quantities[i];
      final productTotalAmount = cartItem.product.price * quantity;

      products.add({
        'productName': cartItem.product.name,
        'productQuantity': quantity,
        'productTotalAmount': productTotalAmount,
      });
      totalAmount += productTotalAmount as int;
    }
    bool userExists = await _checkUser();
    if (userExists) {
      Get.to(
          () => CheckoutScreen(products: products, totalAmount: totalAmount));
    } else {
      Get.toNamed(RouteName.signinView);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    double totalAmount = 0;
    for (int i = 0; i < cartController.cartItems.length; i++) {
      totalAmount += cartController.cartItems[i].product.price * quantities[i];
    }

    void _updateTotalAmount(double newTotalAmount) {
      setState(() {
        totalAmount = newTotalAmount;
      });
    }

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
        () => ListView.builder(
          itemCount: cartController.cartItems.length,
          itemBuilder: (context, index) {
            final cartItem = cartController.cartItems[index];
            final quantity = quantities[index];
            final productTotalAmount = cartItem.product.price * quantity;

            return Padding(
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
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: searchBackground,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(
                        'assets/images/product-1-1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    addHorizontalSpace(20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                cartItem.product.name.toString(),
                                style: textTheme.bodyLarge,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.bottomSheet(
                                    ProductBottomSheet(
                                      totalPrice: productTotalAmount,
                                      cartItem: cartItem,
                                      onDelete: () {
                                        cartController.removeFromCart(cartItem);
                                        Utils.snackBar("Removed",
                                            "Product removed from Cart.");
                                      },
                                      onUpdateTotalAmount: (newTotalAmount) {
                                        _updateTotalAmount(newTotalAmount);
                                      },
                                    ),
                                  );
                                },
                                child: const Icon(Icons.delete_outline_rounded),
                              ),
                            ],
                          ),
                          addVerticalSpace(Get.height * 0.015),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rs${productTotalAmount.toStringAsFixed(2)}",
                                style: textTheme.bodySmall,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: searchBackground,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.remove,
                                        size: 18,
                                      ),
                                      onPressed: (quantity > 1)
                                          ? () => decreaseQuantity(index)
                                          : null,
                                    ),
                                    Text(
                                      quantity.toString(),
                                      style: textTheme.bodySmall,
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.add,
                                        size: 18,
                                      ),
                                      onPressed: () => increaseQuantity(index),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 100,
        child: Container(
          height: 100,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          padding:
              const EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total price',
                    style: textTheme.bodyMedium,
                  ),
                  Text(
                    'Rs ${totalAmount.toStringAsFixed(2)}',
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  final cartItems = cartController.cartItems;
                  if (cartItems.isEmpty) {
                    Get.defaultDialog(
                      title: 'Cart Is Empty!!!',
                      titlePadding: const EdgeInsets.all(20),
                      contentPadding: const EdgeInsets.all(20),
                      backgroundColor: const Color.fromARGB(255, 255, 0, 38),
                      content: const Column(
                        children: [
                          Text(
                            "Please add something in cart to procced.",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      confirm: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          'Okay',
                          style: TextStyle(
                              // color: whiteColor,
                              ),
                        ),
                      ),
                    );
                  } else {
                    proceedToCheckout();
                  }
                },
                child: Row(
                  children: [
                    const Text('Checkout'),
                    addHorizontalSpace(10),
                    const Icon(Icons.arrow_forward),
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
