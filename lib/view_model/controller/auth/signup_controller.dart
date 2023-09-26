// ignore_for_file: unused_local_variable, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api_call/api_services.dart';
import '../../../model/auth/signup_model.dart';
import '../../../resource/utils/utils.dart';

class SignUpController extends GetxController {
  // focus change
  RxBool isNameFocused = false.obs;
  RxBool isEmailFocused = false.obs;
  RxBool isPasswordFocused = false.obs;
  RxBool isConfirmPasswordFocused = false.obs;

  void setNameFocus(bool value) {
    isNameFocused.value = value;
  }

  void setEmailFocus(bool value) {
    isEmailFocused.value = value;
  }

  void setPasswordFocus(bool value) {
    isPasswordFocused.value = value;
  }

  void setConfirmPasswordFocus(bool value) {
    isConfirmPasswordFocused.value = value;
  }

  // Form Key
  // final getx = GetConnect();

  // api models
  final _api = SignUpModel();

  // text field controller
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final ApiService _apiService = ApiService();

  Future<void> signupApi() async {
    final Map<String, void> data = {
      "name": nameController.value.text,
      "email": emailController.value.text,
      "password": passwordController.value.text,
      "c_password": confirmPasswordController.value.text
    };

    if (_validateFormData(data)) {
      await _api.signupApi(data).then((response) {
        if (response != null) {
          Utils.snackBar('Success', 'Signup Successful');
          _clearFormFields();
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

  void _clearFormFields() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  // void postData() async {
  //   final data = {
  //     "name": nameController.value.text.trim(),
  //     "email": emailController.value.text.trim(),
  //     "password": passwordController.value.text,
  //     "c_password": confirmPasswordController.value.text
  //   };
  //   final response = getx.post(Api.signupUrl, data);
  //   if (kDebugMode) {
  //     print(response);
  //   }
  // }
}
