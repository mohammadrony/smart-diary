import 'package:diary_ui/app/modules/home/local_widgets/task_card_widget.dart';
import 'package:diary_ui/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
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
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: NoGlowBehavior(),
                    child: ListView(
                      children: [
                        TaskCardWidget(
                          title: 'Get Started!',
                          desc:
                              // ignore: lines_longer_than_80_chars
                              'Hello User! Welcome to Smart Diary app, This is a default task that you can edit or delete to start using the app.',
                        ),
                        TaskCardWidget(
                          title: 'Get Started!',
                          desc:
                              // ignore: lines_longer_than_80_chars
                              'Hello User! Welcome to Smart Diary app, This is a default task that you can edit or delete to start using the app.',
                        ),
                        TaskCardWidget(
                          title: 'Get Started!',
                          desc:
                              // ignore: lines_longer_than_80_chars
                              'Hello User! Welcome to Smart Diary app, This is a default task that you can edit or delete to start using the app.',
                        ),
                        TaskCardWidget(
                          title: 'Get Started!',
                          desc:
                              // ignore: lines_longer_than_80_chars
                              'Hello User! Welcome to Smart Diary app, This is a default task that you can edit or delete to start using the app.',
                        ),
                        TaskCardWidget(
                          title: 'Get Started!',
                          desc:
                              // ignore: lines_longer_than_80_chars
                              'Hello User! Welcome to Smart Diary app, This is a default task that you can edit or delete to start using the app.',
                        ),
                        TaskCardWidget(
                          title: 'Get Started!',
                          desc:
                              // ignore: lines_longer_than_80_chars
                              'Hello User! Welcome to Smart Diary app, This is a default task that you can edit or delete to start using the app.',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 24,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.TASK_DETAILS);
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
    ));
  }
}

class NoGlowBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
