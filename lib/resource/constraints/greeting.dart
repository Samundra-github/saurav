import 'package:flutter/material.dart';
import 'package:gokyo/resource/constraints/height_width.dart';
import 'package:gokyo/resource/theme/colors.dart';

class Greeting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var hour = now.hour;
    var greeting;

    if (hour < 12) {
      greeting = "Good Morning";
    } else if (hour < 18) {
      greeting = "Good Afternoon";
    } else {
      greeting = "Good Evening";
    }

    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          children: [
            Text(
              "$greeting ",
              style: textTheme.bodySmall,
            ),
            const Icon(
              Icons.waving_hand_rounded,
              color: yellowColor,
            )
          ],
        ),
        addVerticalSpace(5),
        Text(
          'Samundra Bhandari',
          style: textTheme.bodySmall,
        )
      ],
    );
  }
}
