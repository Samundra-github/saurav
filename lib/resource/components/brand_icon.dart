import 'package:flutter/material.dart';

class BrandButton extends StatelessWidget {
  final String label;
  final double height;
  final Widget brandIcon;

  const BrandButton({
    required this.brandIcon,
    required this.label,
    this.height = 30,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          brandIcon,
          const SizedBox(width: 30),
          Text(
            label,
            style: textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
