import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'app/routes/app_pages.dart';

void main() {
  if (GetPlatform.isWindows || GetPlatform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Application',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
