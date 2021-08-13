import 'package:diary_ui/app/core/utils/helper/validator.dart';
import 'package:diary_ui/app/routes/app_pages.dart';
import 'package:diary_ui/app/widgets/form_input_field_with_icon.dart';
import 'package:diary_ui/app/widgets/form_vertical_spacing.dart';
import 'package:diary_ui/app/widgets/label_button.dart';
import 'package:diary_ui/app/widgets/logo_graphic_header.dart';
import 'package:diary_ui/app/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.emailController.text = Get.parameters['email'] ?? '';
    return Scaffold(
      appBar: appBar(context),
      body: Center(
        child: Form(
          key: _formKey,
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
                          controller.emailController.text = value as String,
                    ),
                    FormVerticalSpace(),
                    PrimaryButton(
                        labelText: 'auth.resetPasswordButton'.tr,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await controller.sendPasswordResetEmail(context);
                          }
                        }),
                    FormVerticalSpace(),
                    signInLink(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget? appBar(BuildContext context) {
    if (controller.emailController.text == '') {
      return null;
    }
    return AppBar(title: Text('auth.resetPasswordTitle'.tr));
  }

  Widget signInLink(BuildContext context) {
    if (controller.emailController.text == '') {
      return LabelButton(
        labelText: 'auth.signInonResetPasswordLabelButton'.tr,
        onPressed: () => Get.offAllNamed(Routes.LOGIN),
      );
    }
    return Container(width: 0, height: 0);
  }
}
