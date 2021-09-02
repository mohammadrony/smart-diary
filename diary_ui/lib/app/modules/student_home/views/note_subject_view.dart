import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NoteSubjectView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 24,
              right: 0,
              child: GestureDetector(
                onTap: () async {
                  print('get topics');
                  // await Get.toNamed(Routes.TASK);
                  // await controller.getTasks();
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    // color: Color(0xFF7349FE),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF7349FE),
                        Color(0xFF643FDB),
                      ],
                      begin: Alignment(0.0, -1.0),
                      end: Alignment(0.0, 1.0),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image(
                    image: AssetImage('assets/images/add_icon.png'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
