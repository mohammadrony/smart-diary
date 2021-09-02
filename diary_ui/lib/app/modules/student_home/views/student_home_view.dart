import 'package:diary_ui/app/modules/student_home/views/note_subject_view.dart';
import 'package:diary_ui/app/modules/student_home/views/task_list_view.dart';
import 'package:diary_ui/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/student_home_controller.dart';

class StudentHomeView extends GetView<StudentHomeController> {
  final List<String> choices = <String>['Settings', 'Profile', 'Signout'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: DefaultTabController(
            initialIndex: 1,
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Diary'),
                actions: [
                  PopupMenuButton<String>(onSelected: (String result) {
                    if (result == 'Profile') {
                      Get.toNamed(Routes.STUDENT_PROFILE);
                    } else if (result == 'Settings') {
                      Get.toNamed(Routes.SETTINGS);
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
                bottom: const TabBar(
                  tabs: <Widget>[
                    Tab(
                      text: 'Notifications',
                    ),
                    Tab(
                      text: 'Tasks',
                    ),
                    Tab(
                      text: 'Notes',
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  Center(
                    child: Text('Notifications'),
                  ),
                  Center(
                    child: TaskListView(),
                  ),
                  Center(
                    child: NoteSubjectView(),
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
