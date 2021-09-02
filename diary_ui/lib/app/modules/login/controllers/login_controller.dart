import 'package:diary_ui/app/data/model/student.dart';
import 'package:diary_ui/app/data/model/teacher.dart';
import 'package:diary_ui/app/data/services/student/service.dart';
import 'package:diary_ui/app/data/services/teacher/service.dart';
import 'package:diary_ui/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var userType = 'STUDENT';
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var error = false;
  var errorMessage = '';

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

  void loginUser() async {
    // showLoadingIndicator();
    if (userType == 'STUDENT') {
      var apiResponse = await StudentService.loginStudent(
        Student(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      if (apiResponse.error == true) {
        error = true;
        errorMessage = apiResponse.errorMessage;
      } else {
        await Get.offAllNamed(Routes.STUDENT_HOME);
      }
    } else if (userType == 'TEACHER') {
      var apiResponse = await TeacherService.loginTeacher(
        Teacher(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      if (apiResponse.error == true) {
        error = true;
        errorMessage = apiResponse.errorMessage;
      } else {
        await Get.offAllNamed(Routes.TEACHER_HOME);
      }
    } else {
      print('User type undefined.');
    }
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
