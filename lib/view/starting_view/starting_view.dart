import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gokyo/resource/constraints/height_width.dart';
import 'package:gokyo/resource/routes/routes_name.dart';
import 'package:gokyo/resource/theme/colors.dart';

class StartingView extends StatelessWidget {
  const StartingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteName.startingViewTwo);
      },
      child: Container(
        height: height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.8,
            image: AssetImage('assets/images/start-1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 350, right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(height * 0.25),
              Row(
                children: [
                  Text(
                    'Welcome to ',
                    style: textTheme.headlineLarge,
                  ),
                  const Icon(
                    Icons.waving_hand,
                    color: yellowColor,
                    size: 34,
                  ),
                ],
              ),
              addVerticalSpace(height * 0.001),
              Text(
                'Gokyo',
                style: textTheme.headlineLarge,
              ),
              addVerticalSpace(height * 0.0125),
              Text(
                'The best e-commerce app of the century for your daily needs.',
                style: textTheme.displayMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
