import 'package:get/get.dart';

import 'package:diary_ui/app/modules/login/bindings/login_binding.dart';
import 'package:diary_ui/app/modules/login/views/login_view.dart';
import 'package:diary_ui/app/modules/register/bindings/register_binding.dart';
import 'package:diary_ui/app/modules/register/views/register_view.dart';
import 'package:diary_ui/app/modules/reset_password/bindings/reset_password_binding.dart';
import 'package:diary_ui/app/modules/reset_password/views/reset_password_view.dart';
import 'package:diary_ui/app/modules/settings/bindings/settings_binding.dart';
import 'package:diary_ui/app/modules/settings/views/settings_view.dart';
import 'package:diary_ui/app/modules/student_home/bindings/student_home_binding.dart';
import 'package:diary_ui/app/modules/student_home/views/student_home_view.dart';
import 'package:diary_ui/app/modules/student_profile/bindings/student_profile_binding.dart';
import 'package:diary_ui/app/modules/student_profile/views/student_profile_view.dart';
import 'package:diary_ui/app/modules/student_task/bindings/student_task_binding.dart';
import 'package:diary_ui/app/modules/student_task/views/student_task_view.dart';
import 'package:diary_ui/app/modules/teacher_home/bindings/teacher_home_binding.dart';
import 'package:diary_ui/app/modules/teacher_home/views/teacher_home_view.dart';
import 'package:diary_ui/app/modules/welcome/bindings/welcome_binding.dart';
import 'package:diary_ui/app/modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
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
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_HOME,
      page: () => StudentHomeView(),
      binding: StudentHomeBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_PROFILE,
      page: () => StudentProfileView(),
      binding: StudentProfileBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_TASK,
      page: () => StudentTaskView(),
      binding: StudentTaskBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER_HOME,
      page: () => TeacherHomeView(),
      binding: TeacherHomeBinding(),
    ),
  ];
}
