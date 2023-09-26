// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gokyo/resource/constraints/height_width.dart';
import 'package:gokyo/resource/routes/routes_name.dart';

import '../../resource/theme/colors.dart';

class StartingViewTwo extends StatefulWidget {
  const StartingViewTwo({Key? key}) : super(key: key);

  @override
  _StartingViewTwoState createState() => _StartingViewTwoState();
}

class _StartingViewTwoState extends State<StartingViewTwo> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isLastSlide = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_pageListener);
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }

  void _pageListener() {
    if (_pageController.page == 2) {
      setState(() {
        _isLastSlide = true;
      });
    } else {
      setState(() {
        _isLastSlide = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * 0.84,
            width: double.infinity,
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                buildSlide(
                  'assets/images/start-2.jpg',
                  'We provide high \n quality products just for you',
                  textTheme,
                  height,
                ),
                buildSlide(
                  'assets/images/starting.jpg',
                  'Your satisfaction is \n Our number one priority',
                  textTheme,
                  height,
                ),
                buildSlide(
                  'assets/images/start-3.jpg',
                  'Let\'s fulfill your \n daily needs with Gokyo right now!',
                  textTheme,
                  height,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicator(),
          ),
          addVerticalSpace(height * 0.05),
          Container(
            padding: const EdgeInsets.only(right: 20, left: 20),
            height: height * 0.06,
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () {
                if (_isLastSlide) {
                  Get.toNamed(RouteName.getinView);
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Text(_isLastSlide ? 'Get Started' : 'Next'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSlide(
    String imagePath,
    String slideText,
    TextTheme textTheme,
    double height,
  ) {
    return GestureDetector(
      onTap: () {
        if (_currentPage == 0) {
          _pageController.animateToPage(
            2,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else {
          _pageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      child: Column(
        children: [
          Container(
            // margin: const EdgeInsets.only(right: 10, left: 10),
            height: height * 0.6,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(
                top: 20,
                right: 30,
                left: 30,
              ),
              child: Column(
                children: [
                  Text(
                    slideText,
                    textAlign: TextAlign.center,
                    style: textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      indicators.add(
        GestureDetector(
          onTap: () {
            _pageController.animateToPage(
              i,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          child: _buildIndicator(i == _currentPage),
        ),
      );
    }
    return indicators;
  }

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
