import 'package:get/get.dart';

import 'package:diary_ui/app/modules/home/bindings/home_binding.dart';
import 'package:diary_ui/app/modules/home/views/home_view.dart';
import 'package:diary_ui/app/modules/login/bindings/login_binding.dart';
import 'package:diary_ui/app/modules/login/views/login_view.dart';
import 'package:diary_ui/app/modules/profile/bindings/profile_binding.dart';
import 'package:diary_ui/app/modules/profile/views/profile_view.dart';
import 'package:diary_ui/app/modules/register/bindings/register_binding.dart';
import 'package:diary_ui/app/modules/register/views/register_view.dart';
import 'package:diary_ui/app/modules/reset_password/bindings/reset_password_binding.dart';
import 'package:diary_ui/app/modules/reset_password/views/reset_password_view.dart';
import 'package:diary_ui/app/modules/settings/bindings/settings_binding.dart';
import 'package:diary_ui/app/modules/settings/views/settings_view.dart';
import 'package:diary_ui/app/modules/task/bindings/task_binding.dart';
import 'package:diary_ui/app/modules/task/views/task_view.dart';
import 'package:diary_ui/app/modules/welcome/bindings/welcome_binding.dart';
import 'package:diary_ui/app/modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TASK,
      page: () => TaskView(),
      binding: TaskBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}
