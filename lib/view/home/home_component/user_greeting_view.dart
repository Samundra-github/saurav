import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gokyo/resource/constraints/greeting.dart';
import 'package:gokyo/resource/constraints/height_width.dart';
import 'package:gokyo/resource/routes/routes_name.dart';

class UserGreetings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 10),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/banner-2.jpg'),
                  ),
                ),
              ],
            ),
            addHorizontalSpace(10),
            Greeting(),
            addHorizontalSpace(30),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.bell,
                size: 26,
              ),
            ),
            IconButton(
              onPressed: () {
                Get.toNamed(RouteName.wishlistView);
              },
              icon: const Icon(
                Icons.favorite_border_rounded,
                size: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
