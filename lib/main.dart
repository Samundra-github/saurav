// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:gokyo/view/home/nav_view.dart';
import 'package:gokyo/view/starting_view/splash_view.dart';
import 'package:gokyo/view_model/controller/home/product_controller.dart';
import 'package:gokyo/view_model/controller/product/cart_controller.dart';
import 'package:gokyo/view_model/controller/product/wishlist_controller.dart';
import 'package:gokyo/view_model/services/network_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'resource/routes/routes.dart';
import 'resource/theme/theme.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
  Get.put<ProductController>(ProductController());
  Get.put<NetwrokServiceController>(NetwrokServiceController(),
      permanent: true);
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({required this.prefs, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishlistController = Get.put(WishlistController());
    final cartController = Get.put(CartController());
    return GetMaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      getPages: AppRoutes.appRoutes(),
      initialBinding: BindingsBuilder(() {
        Get.put<SharedPreferences>(prefs);
      }),
      home: const SplashView(),
    );
  }
}
