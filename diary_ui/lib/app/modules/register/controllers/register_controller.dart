import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
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

  void registerWithEmailAndPassword(BuildContext context) async {
    // TODO: Impliment registerWithEmailAndPassword method
    print('registerWithEmailAndPassword');
    // showLoadingIndicator();
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
