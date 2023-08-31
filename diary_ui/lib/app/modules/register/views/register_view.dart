import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
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

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: CustomRadioButton(
                        elevation: 0,
                        absoluteZeroSpacing: true,
                        unSelectedColor: Theme.of(context).canvasColor,
                        buttonLables: [
                          "I'm a Teacher",
                          "I'm a Student",
                        ],
                        buttonValues: [
                          'TEACHER',
                          'STUDENT',
                        ],
                        buttonTextStyle: ButtonTextStyle(
                          selectedColor: Colors.white,
                          unSelectedColor: Colors.black,
                          textStyle: TextStyle(fontSize: 16),
                        ),
                        defaultSelected: controller.userType,
                        radioButtonValue: (value) {
                          controller.userType = value.toString();
                        },
                        selectedColor: Theme.of(context).colorScheme.secondary,
                        width: (Get.width - 48) / 2,
                        enableShape: true,
                      ),
                    ),
                    SizedBox(height: 30),
                    Center(
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
                                    controller: controller.nameController,
                                    iconPrefix: Icons.person,
                                    labelText: 'auth.nameFormField'.tr,
                                    validator: Validator().name,
                                    onChanged: (value) => null,
                                    onSaved: (value) =>
                                        controller.nameController.text = value!,
                                  ),
                                  FormVerticalSpace(),
                                  FormInputFieldWithIcon(
                                    controller: controller.emailController,
                                    iconPrefix: Icons.email,
                                    labelText: 'auth.emailFormField'.tr,
                                    validator: Validator().email,
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (value) => null,
                                    onSaved: (value) => controller
                                        .emailController.text = value!,
                                  ),
                                  FormVerticalSpace(),
                                  FormInputFieldWithIcon(
                                    controller: controller.passwordController,
                                    iconPrefix: Icons.lock,
                                    labelText: 'auth.passwordFormField'.tr,
                                    validator: Validator().password,
                                    obscureText: true,
                                    onChanged: (value) => null,
                                    onSaved: (value) => controller
                                        .passwordController.text = value!,
                                    maxLines: 1,
                                  ),
                                  FormVerticalSpace(),
                                  PrimaryButton(
                                      labelText: 'auth.signUpButton'.tr,
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          await SystemChannels.textInput
                                              .invokeMethod('TextInput.hide');
                                          //to hide the keyboard - if any
                                          await controller.registerUser();
                                        }
                                      }),
                                  FormVerticalSpace(),
                                  LabelButton(
                                    labelText: 'auth.signInLabelButton'.tr,
                                    onPressed: () => Get.toNamed(Routes.LOGIN),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
