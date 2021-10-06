import 'package:diary_ui/app/modules/teacher_home/widgets/teacher_course_card_widget.dart';
import 'package:diary_ui/app/routes/app_pages.dart';
import 'package:diary_ui/app/widgets/no_glow_behavior.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/teacher_home_controller.dart';

class TeacherHomeView extends GetView<TeacherHomeController> {
  final List<String> choices = <String>['Settings', 'Profile', 'Signout'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diary'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(onSelected: (String result) {
            if (result == 'Profile') {
              Get.toNamed(Routes.TEACHER_PROFILE);
            } else if (result == 'Settings') {
              Get.toNamed(Routes.SETTINGS);
            } else if (result == 'Signout') {
              controller.signout();
            }
          }, itemBuilder: (BuildContext context) {
            return choices.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          }),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        color: Color(0xFFF6F6F6),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 32, top: 32),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('assets/images/logo.png'),
                      ),
                      SizedBox(width: 32),
                      Text(
                        'Your Courses',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF211551),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: NoGlowBehavior(),
                    child: Obx(() => ListView.builder(
                        itemCount: controller.courses.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              await Get.toNamed(Routes.TEACHER_COURSE +
                                  '?id=' +
                                  controller.courses[index].id);
                              await controller.getTeacherCourses();
                            },
                            child: TeacherCourseCardWidget(
                                course: controller.courses[index]),
                          );
                        })),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Create Course'),
        onPressed: () async {
          await Get.toNamed(Routes.TEACHER_COURSE);
          await controller.getTeacherCourses();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        icon: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
