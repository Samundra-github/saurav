import 'package:get/get.dart';
import 'package:gokyo/view/auth/update_profile_view.dart';
import 'package:gokyo/view/home/home_view.dart';
import 'package:gokyo/view/home/nav_view.dart';
import 'package:gokyo/view/shop/view/cart_view.dart';
import 'package:gokyo/view/starting_view/getin_view.dart';
import 'package:gokyo/view/starting_view/starting_view.dart';
import 'package:gokyo/view/starting_view/starting_view_two.dart';
import '../../view/auth/login.dart';
import '../../view/auth/register.dart';
import '../../view/shop/view/wishlist_view.dart';
import '../../view/starting_view/splash_view.dart';
import 'routes_name.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashView,
          page: () => const SplashView(),
        ),
        GetPage(
          name: RouteName.signinView,
          page: () => SigninView(),
          transitionDuration: const Duration(milliseconds: 300),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.signupView,
          page: () => const SignUpView(),
          transitionDuration: const Duration(milliseconds: 300),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.profilUpdateView,
          page: () => const UpdateProfileView(),
          transitionDuration: const Duration(milliseconds: 300),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.getinView,
          page: () => const GetinView(),
          transitionDuration: const Duration(milliseconds: 300),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.bottomNavBar,
          page: () => BottomNavView(),
          transitionDuration: const Duration(milliseconds: 300),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.startingView,
          page: () => const StartingView(),
          transitionDuration: const Duration(milliseconds: 300),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.startingViewTwo,
          page: () => const StartingViewTwo(),
          transitionDuration: const Duration(milliseconds: 300),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.homeView,
          page: () => const HomeView(),
          transitionDuration: const Duration(milliseconds: 300),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.cartView,
          page: () => CartView(),
          transitionDuration: const Duration(milliseconds: 300),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.wishlistView,
          page: () => WishlistView(),
          transitionDuration: const Duration(milliseconds: 300),
          transition: Transition.rightToLeft,
        ),
      ];
}
