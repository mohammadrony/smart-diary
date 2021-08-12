import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'app/controllers/language_controller.dart';
import 'app/controllers/theme_controller.dart';
import 'app/core/utils/translations.dart';
import 'app/routes/app_pages.dart';

void main() async {
  // if (GetPlatform.isWindows || GetPlatform.isLinux) {
  //   sqfliteFfiInit();
  //   databaseFactory = databaseFactoryFfi;
  // }

  await GetStorage.init();
  Get.put<ThemeController>(ThemeController());
  Get.put<LanguageController>(LanguageController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Application',
      translations: MyTranslations(),
      locale: Locale('en'),
      fallbackLocale: Locale('en'),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
