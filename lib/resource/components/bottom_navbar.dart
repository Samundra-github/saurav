import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../routes/routes_name.dart';

class MyBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GNav(
      gap: 20,
      tabs: [
        GButton(
          icon: Icons.home_outlined,
          text: 'Home',
          onPressed: () => Get.toNamed(RouteName.homeView),
        ),
        GButton(
          icon: Icons.shopping_bag_outlined,
          text: 'Shop',
          onPressed: () => Get.toNamed(RouteName.signinView),
        ),
        GButton(
          icon: Icons.settings,
          text: 'Setting',
          onPressed: () => Get.toNamed(RouteName.getinView),
        )
      ],
    );
  }
}
