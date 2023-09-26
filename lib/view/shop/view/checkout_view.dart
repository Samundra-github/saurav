import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../resource/constraints/height_width.dart';
import '../../../resource/routes/routes_name.dart';

class CheckoutScreen extends StatelessWidget {
  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');

    Get.toNamed(RouteName.signinView);
  }

  final List<Map<String, dynamic>> products;
  final int totalAmount;

  CheckoutScreen({required this.products, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColor.primaryAppbarColor,
        title: const Text('Checkout'),
        actions: [
          IconButton(
            onPressed: () {
              _logout();
            },
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            addVerticalSpace(Get.height * 0.016),
            ListView.builder(
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                final productName = product['productName'] as String;
                final productQuantity = product['productQuantity'] as int;
                final productTotalAmount = product['productTotalAmount'] as int;

                return ListTile(
                  title: Text(
                    productName,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Quantity: $productQuantity',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    'Rs. $productTotalAmount',
                    style: const TextStyle(
                        fontSize: 18,
                        // color: AppColor.redColor,
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
            addVerticalSpace(Get.height * 0.016),
            const Divider(),
            addVerticalSpace(Get.height * 0.016),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Amount:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rs. $totalAmount',
                  style: const TextStyle(
                    fontSize: 18,
                    // color: AppColor.redColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
