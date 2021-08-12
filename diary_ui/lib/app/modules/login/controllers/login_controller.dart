import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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

  void loginWithEmailAndPassword(BuildContext context) {
    // TODO: Impliment loginInWithEmailAndPassword method
    print('loginWithEmailAndPassword');
    // showLoadingIndicator();
    // try {
    //   await _auth.signInWithEmailAndPassword(
    //       email: emailController.text.trim(),
    //       password: passwordController.text.trim());
    //   emailController.clear();
    //   passwordController.clear();
    //   hideLoadingIndicator();
    // } catch (error) {
    //   hideLoadingIndicator();
    //   Get.snackbar('auth.signInErrorTitle'.tr, 'auth.signInError'.tr,
    //       snackPosition: SnackPosition.BOTTOM,
    //       duration: Duration(seconds: 7),
    //       backgroundColor: Get.theme.snackBarTheme.backgroundColor,
    //       colorText: Get.theme.snackBarTheme.actionTextColor);
    // }
  }
}
