import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gokyo/resource/constraints/height_width.dart';
import 'package:gokyo/resource/routes/routes_name.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            addVerticalSpace(height * .3),
            Lottie.asset(
              'assets/animation/cart1.json',
              repeat: false,
              onLoaded: (composition) {
                Future.delayed(const Duration(seconds: 5), () {
                  Get.toNamed(RouteName.bottomNavBar);
                });
              },
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                  width: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
