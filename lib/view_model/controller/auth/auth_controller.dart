import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  RxBool isPasswordVisible = true.obs;

  final SharedPreferences _prefs = Get.find<SharedPreferences>();
  final RxBool rememberMe = false.obs;

  RxBool isFocused = false.obs;

  void setFocus(bool value) {
    isFocused.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    rememberMe.value = _prefs.getBool('rememberMe') ?? false;
  }

  void toggleRememberMe(bool? value) {
    if (value != null) {
      rememberMe.value = value;
      _prefs.setBool('rememberMe', value);
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }
}
