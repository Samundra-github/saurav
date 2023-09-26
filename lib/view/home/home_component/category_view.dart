import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gokyo/resource/constraints/height_width.dart';
import 'package:gokyo/resource/routes/routes_name.dart';
import 'package:gokyo/resource/theme/colors.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteName.getinView);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: photoBackground,
                      ),
                      child: Image.asset(
                        'assets/images/earring.png',
                      ),
                    ),
                  ),
                  addVerticalSpace(10),
                  Text(
                    'Earring',
                    style: textTheme.bodyLarge,
                  )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteName.getinView);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: photoBackground,
                      ),
                      child: Image.asset(
                        'assets/images/necklace.png',
                      ),
                    ),
                  ),
                  addVerticalSpace(10),
                  Text(
                    'Necklace',
                    style: textTheme.bodyLarge,
                  )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteName.getinView);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: photoBackground,
                      ),
                      child: Image.asset(
                        'assets/images/ring.png',
                      ),
                    ),
                  ),
                  addVerticalSpace(10),
                  Text(
                    'Ring',
                    style: textTheme.bodyLarge,
                  )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteName.getinView);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: photoBackground,
                      ),
                      child: Image.asset(
                        'assets/images/bangle.png',
                      ),
                    ),
                  ),
                  addVerticalSpace(10),
                  Text(
                    'Bangle',
                    style: textTheme.bodyLarge,
                  )
                ],
              ),
            ],
          ),
          addVerticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteName.getinView);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: photoBackground,
                      ),
                      child: Image.asset(
                        'assets/images/chain.png',
                      ),
                    ),
                  ),
                  addVerticalSpace(10),
                  Text(
                    'Chain',
                    style: textTheme.bodyLarge,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
