import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gokyo/model/auth/signin_model.dart';
import 'package:gokyo/resource/routes/routes_name.dart';

import '../../../resource/utils/utils.dart';

class SignInController extends GetxController {
  // Form Key

  // api models
  final _api = SignInModel();

  // text field controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Sign Up api call
  RxBool loading = false.obs;

  RxBool isEmailFocused = false.obs;
  RxBool isPasswordFocused = false.obs;

  void setEmailFocus(bool value) {
    isEmailFocused.value = value;
  }

  void setPasswordFocus(bool value) {
    isPasswordFocused.value = value;
  }

  Future<void> signinApi() async {
    final Map<String, void> data = {
      "email": emailController.value.text,
      "password": passwordController.value.text,
    };

    if (_validateFormData(data)) {
      await _api.signinApi(data).then((response) {
        if (response != null) {
          Utils.snackBar('Success', 'Signup Successful');
          Get.toNamed(RouteName.homeView);
          // _clearFormFields();
        } else {
          Utils.snackBar('Error', 'Failed to signup. Please try again.');
        }
      }).catchError((error) {
        Utils.snackBar('Login', 'Signup Successful');
        print(error.toString());
      });
    } else {
      Utils.snackBar('Error', 'Please fill in all the required fields.');
    }
  }

  bool _validateFormData(Map<String, dynamic> data) {
    return true;
  }
}
