import 'package:flutter/material.dart';
import 'package:gokyo/view/home/home_component/category_view.dart';
import 'package:gokyo/view/home/home_component/product_tab_view.dart';
import 'package:gokyo/view/home/home_component/search_view.dart';
import 'package:gokyo/view/home/home_component/special_view.dart';
import 'package:gokyo/view/home/home_component/user_greeting_view.dart';

import '../../resource/constraints/height_width.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      // bottomNavigationBar: MyBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserGreetings(),
            addVerticalSpace(15),
            SearchView(),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Special Offers",
                        style: textTheme.bodyLarge,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'See All',
                            style: textTheme.bodyLarge,
                          ))
                    ],
                  ),
                  addVerticalSpace(15),
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: SpecialOfferesView(),
                  ),
                ],
              ),
            ),
            const CategoryView(),
            addVerticalSpace(15),
            Container(
              // height: 500,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Most Popular",
                        style: textTheme.bodyLarge,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'See All',
                            style: textTheme.bodyLarge,
                          ))
                    ],
                  ),
                  addVerticalSpace(15),
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: ProductTabView(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
