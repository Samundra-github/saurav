import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gokyo/resource/constraints/height_width.dart';

import '../../../resource/theme/colors.dart';

class ProductReviews extends StatelessWidget {
  final int productId; // Product ID
  ProductReviews({required this.productId});

  @override
  Widget build(BuildContext context) {
    List<String>? reviews =
        GetStorage().read<List<String>>(productId.toString());
    // Use the null-aware operator to provide an empty list if reviews is null
    List<String> reviewList = reviews ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Users Reviews:',
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        addVerticalSpace(8),
        Container(
          padding: const EdgeInsets.only(
            bottom: 10,
            right: 15,
            left: 15,
          ),
          decoration: const BoxDecoration(
            color: photoBackground,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: reviewList.length,
            itemBuilder: (context, index) {
              return Text(
                reviewList[index],
                style: TextStyle(fontSize: 12, color: blackColor),
              );
            },
          ),
        ),
      ],
    );
  }
}
