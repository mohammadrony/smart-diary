import 'dart:ffi';

import 'package:diary_ui/app/modules/home/local_widgets/task_card_widget.dart';
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
          vertical: 32,
        ),
        color: Color(0xFFF6F6F6),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 32),
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                  ),
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
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFF7349FE),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image(
                  image: AssetImage('assets/images/add_icon.png'),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
