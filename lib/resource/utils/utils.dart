import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gokyo/resource/theme/colors.dart';

class Utils {
  // Field Focus
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  // Toast Message
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: blackColor,
      textColor: whiteColor,
      gravity: ToastGravity.BOTTOM,
    );
  }

  // Snackbar
  static snackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
    );
  }
}
