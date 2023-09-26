import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gokyo/resource/routes/routes_name.dart';
import 'package:gokyo/resource/theme/colors.dart';
import 'package:gokyo/view/home/home_view.dart';
import 'package:gokyo/view/shop/view/cart_view.dart';

import '../auth/login.dart';
import '../auth/register.dart';

class BottomNavView extends StatelessWidget {
  final List<GetPage> screens = [
    GetPage(name: RouteName.homeView, page: () => const HomeView()),
    GetPage(name: RouteName.cartView, page: () => CartView()),
    GetPage(name: RouteName.signinView, page: () => SigninView()),
    GetPage(name: RouteName.signupView, page: () => const SignUpView()),
  ];

  final RxInt currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Obx(() => screens[currentIndex.value]
          .page()), // Call the function to get the widget
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex.value,
        onTap: (index) => currentIndex.value = index,
        iconSize: 20,
        selectedFontSize: 16,
        selectedLabelStyle: textTheme.bodyLarge,
        unselectedLabelStyle: textTheme.bodySmall,
        unselectedItemColor: navBarColor,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout_rounded),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
