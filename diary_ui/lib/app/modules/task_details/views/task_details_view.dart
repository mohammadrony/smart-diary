import 'package:diary_ui/app/modules/task_details/local_widgets/todo_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/task_details_controller.dart';

class TaskDetailsView extends GetView<TaskDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 6.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => {
                        Get.back(),
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Image(
                          image:
                              AssetImage('assets/images/back_arrow_icon.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter task title...',
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF211551),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter description for the task...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
                ),
              ),
              TodoWidget(),
              TodoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
