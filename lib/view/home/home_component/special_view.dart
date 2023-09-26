import 'package:flutter/material.dart';
import 'package:gokyo/resource/theme/colors.dart';

class SpecialOfferesView extends StatefulWidget {
  const SpecialOfferesView({super.key});

  @override
  State<SpecialOfferesView> createState() => _SpecialOfferesViewState();
}

class _SpecialOfferesViewState extends State<SpecialOfferesView> {
  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();

    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: photoBackground,
            borderRadius: BorderRadius.circular(30),
          ),
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Text(
                            "25%",
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 28,
                            ),
                          ),
                        ),
                        const Text(
                          'Today\'s Special!',
                          style: TextStyle(
                            color: blackColor,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Get discount for every\norder, only valid for today',
                          style: textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 150,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: photoBackground,
                          ),
                          child: Image.asset(
                            'assets/images/product-4-1.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // List<Widget> _buildPageIndicator() {
  //   List<Widget> indicators = [];
  //   for (int i = 0; i < 3; i++) {
  //     indicators.add(
  //       GestureDetector(
  //         onTap: () {
  //           _pageController.animateToPage(
  //             i,
  //             duration: const Duration(milliseconds: 300),
  //             curve: Curves.easeInOut,
  //           );
  //         },
  //         child: _buildIndicator(i == _currentPage),
  //       ),
  //     );
  //   }
  //   return indicators;
  // }

  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? blackColor : greyColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
