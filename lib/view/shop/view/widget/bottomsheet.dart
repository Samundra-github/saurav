import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resource/constraints/height_width.dart';
import '../../../../resource/theme/colors.dart';
import '../../../../resource/utils/utils.dart';
import '../../../../view_model/controller/product/cart_controller.dart';

class ProductBottomSheet extends StatelessWidget {
  final CartItem cartItem;
  final Function onDelete;
  final totalPrice;
  final Function(double totalAmount) onUpdateTotalAmount;
  ProductBottomSheet(
      {required this.cartItem,
      required this.onDelete,
      required this.totalPrice,
      required this.onUpdateTotalAmount});

  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      height: 370,
      padding: const EdgeInsets.only(
        right: 20,
        left: 20,
        top: 20,
        bottom: 20,
      ),
      decoration: const BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Text(
            'Remove From Cart?',
            style: textTheme.headlineSmall,
          ),
          addVerticalSpace(20),
          const Divider(
            thickness: 1,
            height: 2,
            color: photoBackground,
          ),
          addVerticalSpace(25),
          Container(
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
                        ],
                      ),
                      addVerticalSpace(Get.height * 0.015),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rs$totalPrice",
                            style: textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          addVerticalSpace(20),
          const Divider(
            thickness: 1,
            height: 2,
            color: photoBackground,
          ),
          addVerticalSpace(25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
                  foregroundColor: MaterialStatePropertyAll<Color>(blackColor),
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(photoBackground),
                ),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
                ),
                onPressed: () {
                  cartController.removeFromCart(cartItem);
                  Get.back();
                  onUpdateTotalAmount(
                      totalPrice); // Call the callback to update totalAmount
                  Utils.snackBar("Removed", "Product removed from Cart.");
                },
                child: const Text('Yes, Remove'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
