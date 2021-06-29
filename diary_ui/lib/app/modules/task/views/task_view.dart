import 'package:diary_ui/app/data/model/task.dart';
import 'package:diary_ui/app/modules/task/widgets/todo_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
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
                              image: AssetImage(
                                  'assets/images/back_arrow_icon.png'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            onSubmitted: (value) async {
                              if (value != '') {
                                var newTask = Task(title: value);
                                await controller.createTask(newTask);
                              }
                            },
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter description for the task...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
                      ),
                    ),
                  ),
                  TodoWidget(text: 'todo 1', isDone: true),
                  TodoWidget(text: 'todo 2', isDone: false),
                  TodoWidget(text: 'todo 3', isDone: true),
                  TodoWidget(text: 'todo 4', isDone: false),
                  TodoWidget(text: 'todo 5', isDone: true),
                ],
              ),
              Positioned(
                bottom: 24,
                right: 24,
                child: GestureDetector(
                  onTap: () {
                    // Get.toNamed(Routes.TASK);
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFFFE3577),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image(
                      image: AssetImage('assets/images/delete_icon.png'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
