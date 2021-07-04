import 'package:diary_ui/app/data/model/task.dart';
import 'package:diary_ui/app/data/model/todo.dart';
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
                          child: Obx(
                            () => TextField(
                              onSubmitted: (value) async {
                                if (controller.id == 0) {
                                  if (value != '') {
                                    var newTask =
                                        Task(title: value, description: '');
                                    await controller.createTask(newTask);
                                  }
                                } else {
                                  print('update task');
                                }
                              },
                              controller: TextEditingController()
                                ..text = controller.task.value.title ?? '',
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
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Row(
                          children: [
                            Container(
                              width: 20.0,
                              height: 20.0,
                              margin: EdgeInsets.only(right: 16.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Color(0xFF86829D),
                                  width: 1.5,
                                ),
                              ),
                              child: Image(
                                image:
                                    AssetImage('assets/images/check_icon.png'),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                onSubmitted: (value) async {
                                  if (value != '') {
                                    var newTodo = Todo(
                                      title: value,
                                      isDone: 0,
                                      TaskId: controller.id,
                                    );
                                    await controller.createTodo(newTodo);
                                    await controller.getTodos(controller.id);
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: 'Enter Todo item...',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TodoWidget(text: 'hello', isDone: false),
                  TodoWidget(text: 'hello', isDone: false),
                  TodoWidget(text: 'hello', isDone: false),
                  // Obx(
                  //   () => ListView.builder(
                  //     itemCount: controller.todos.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return TodoWidget(
                  //         text: controller.todos[index].title,
                  //         isDone: controller.todos[index].isDone == 0
                  //             ? false
                  //             : true,
                  //       );
                  //     },
                  //   ),
                  // ),
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
