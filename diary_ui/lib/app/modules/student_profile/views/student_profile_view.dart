import 'package:diary_ui/app/core/utils/helper/validator.dart';
import 'package:diary_ui/app/routes/app_pages.dart';
import 'package:diary_ui/app/widgets/form_input_field_with_icon.dart';
import 'package:diary_ui/app/widgets/form_vertical_spacing.dart';
import 'package:diary_ui/app/widgets/label_button.dart';
import 'package:diary_ui/app/widgets/logo_graphic_header.dart';
import 'package:diary_ui/app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/student_profile_controller.dart';

class StudentProfileView extends GetView<StudentProfileController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('auth.updateProfileTitle'.tr)),
      body: Form(
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
                    controller: controller.nameController,
                    iconPrefix: Icons.person,
                    labelText: 'auth.nameFormField'.tr,
                    validator: Validator().name,
                    onChanged: (value) => null,
                    onSaved: (value) => controller.nameController.text = value!,
                  ),
                  FormVerticalSpace(),
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
                  PrimaryButton(
                      labelText: 'auth.updateUser'.tr,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await SystemChannels.textInput
                              .invokeMethod('TextInput.hide');
                          // TODO: update user info
                          // var _updatedUser = UserModel(
                          //     uid: controller.firestoreUser.value!.uid,
                          //     name: controller.nameController.text,
                          //     email: controller.emailController.text,
                          //     photoUrl:
                          //         controller.firestoreUser.value!.photoUrl);
                          // _updateUserConfirm(context, _updatedUser,
                          //     controller.firestoreUser.value!.email);
                        }
                      }),
                  FormVerticalSpace(),
                  LabelButton(
                    labelText: 'auth.resetPasswordLabelButton'.tr,
                    onPressed: () => Get.to(Routes.RESET_PASSWORD),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
