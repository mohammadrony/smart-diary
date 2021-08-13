import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  //TODO: Implement ResetPasswordController

  TextEditingController emailController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> sendPasswordResetEmail(BuildContext context) async {
    //TODO: Implement sendPasswordResetEmail method

    // showLoadingIndicator();
    // try {
    //   await _auth.sendPasswordResetEmail(email: emailController.text);
    //   hideLoadingIndicator();
    //   Get.snackbar(
    //       'auth.resetPasswordNoticeTitle'.tr, 'auth.resetPasswordNotice'.tr,
    //       snackPosition: SnackPosition.BOTTOM,
    //       duration: Duration(seconds: 5),
    //       backgroundColor: Get.theme.snackBarTheme.backgroundColor,
    //       colorText: Get.theme.snackBarTheme.actionTextColor);
    // } on FirebaseAuthException catch (error) {
    //   hideLoadingIndicator();
    //   Get.snackbar('auth.resetPasswordFailed'.tr, error.message!,
    //       snackPosition: SnackPosition.BOTTOM,
    //       duration: Duration(seconds: 10),
    //       backgroundColor: Get.theme.snackBarTheme.backgroundColor,
    //       colorText: Get.theme.snackBarTheme.actionTextColor);
    // }
  }
}
