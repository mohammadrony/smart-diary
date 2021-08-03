import 'package:diary_ui/app/modules/home/views/note_subject_view.dart';
import 'package:diary_ui/app/modules/home/views/task_list_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
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
      )),
    ));
  }
}
