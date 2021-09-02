import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/teacher_home_controller.dart';

class TeacherHomeView extends GetView<TeacherHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TeacherHomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TeacherHomeView is working, show courses first',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
