import 'package:diary_ui/app/data/model/student.dart';
import 'package:diary_ui/app/data/model/teacher.dart';
import 'package:diary_ui/app/data/model/user_token.dart';
import 'package:diary_ui/app/data/services/student/service.dart';
import 'package:diary_ui/app/data/services/teacher/service.dart';
import 'package:diary_ui/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  var userType = 'STUDENT';
  var userTypePrivate = 'STUDENT';
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var error = false;
  var errorMessage = '';
  var userToken = UserToken().obs;

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

  Future<void> registerUser() async {
    // showLoadingIndicator();
    if (userType == 'STUDENT') {
      var apiResponse = await StudentService.registerStudent(
        Student(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      if (apiResponse.error == true) {
        error = true;
        errorMessage = apiResponse.errorMessage;
      } else {
        userToken.value = apiResponse.data ?? UserToken();
        userTypePrivate = userType;
      }
      await Get.offAllNamed(Routes.HOME);
    } else if (userType == 'TEACHER') {
      var apiResponse = await TeacherService.registerTeacher(
        Teacher(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      if (apiResponse.error == true) {
        error = true;
        errorMessage = apiResponse.errorMessage;
      } else {
        userToken.value = apiResponse.data ?? UserToken();
        userTypePrivate = userType;
      }
    } else {
      print('User type undefined.');
    }
    // try {
    //   await _auth
    //       .createUserWithEmailAndPassword(
    //           email: emailController.text, password: passwordController.text)
    //       .then((result) async {
    //     print('uID: ' + result.user!.uid.toString());
    //     print('email: ' + result.user!.email.toString());
    //     //get photo url from gravatar if user has one
    //     Gravatar gravatar = Gravatar(emailController.text);
    //     String gravatarUrl = gravatar.imageUrl(
    //       size: 200,
    //       defaultImage: GravatarImage.retro,
    //       rating: GravatarRating.pg,
    //       fileExtension: true,
    //     );
    //     //create the new user object
    //     UserModel _newUser = UserModel(
    //         uid: result.user!.uid,
    //         email: result.user!.email!,
    //         name: nameController.text,
    //         photoUrl: gravatarUrl);
    //     //create the user in firestore
    //     _createUserFirestore(_newUser, result.user!);
    //     emailController.clear();
    //     passwordController.clear();
    //     hideLoadingIndicator();
    //   });
    // } on FirebaseAuthException catch (error) {
    //   hideLoadingIndicator();
    //   Get.snackbar('auth.signUpErrorTitle'.tr, error.message!,
    //       snackPosition: SnackPosition.BOTTOM,
    //       duration: Duration(seconds: 10),
    //       backgroundColor: Get.theme.snackBarTheme.backgroundColor,
    //       colorText: Get.theme.snackBarTheme.actionTextColor);
    // }
  }
}
