import 'package:diary_ui/app/core/utils/helper/validator.dart';
import 'package:diary_ui/app/routes/app_pages.dart';
import 'package:diary_ui/app/widgets/form_input_field_with_icon.dart';
import 'package:diary_ui/app/widgets/form_vertical_spacing.dart';
import 'package:diary_ui/app/widgets/label_button.dart';
import 'package:diary_ui/app/widgets/logo_graphic_header.dart';
import 'package:diary_ui/app/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          // key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    LogoGraphicHeader(),
                    SizedBox(height: 48.0),
                    FormInputFieldWithIcon(
                      controller: controller.emailController,
                      iconPrefix: Icons.email,
                      labelText: 'auth.emailFormField'.tr,
                      validator: Validator().email,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => null,
                      onSaved: (value) =>
                          controller.emailController.text = value!,
                    ),
                    FormVerticalSpace(),
                    FormInputFieldWithIcon(
                      controller: controller.passwordController,
                      iconPrefix: Icons.lock,
                      labelText: 'auth.passwordFormField'.tr,
                      validator: Validator().password,
                      obscureText: true,
                      onChanged: (value) => null,
                      onSaved: (value) =>
                          controller.passwordController.text = value!,
                      maxLines: 1,
                    ),
                    FormVerticalSpace(),
                    PrimaryButton(
                        labelText: 'auth.signInButton'.tr,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            controller.loginWithEmailAndPassword(context);
                          }
                        }),
                    FormVerticalSpace(),
                    LabelButton(
                      labelText: 'auth.resetPasswordLabelButton'.tr,
                      onPressed: () => Get.toNamed(Routes.RESET_PASSWORD),
                    ),
                    LabelButton(
                      labelText: 'auth.signUpLabelButton'.tr,
                      onPressed: () => Get.toNamed(Routes.REGISTER),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
