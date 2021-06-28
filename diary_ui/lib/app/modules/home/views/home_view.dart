import 'package:diary_ui/app/data/model/task.dart';
import 'package:diary_ui/app/data/provider/database_provider.dart';
import 'package:diary_ui/app/modules/home/local_widgets/task_card_widget.dart';
import 'package:diary_ui/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final DatabaseProvider _dbProvider = DatabaseProvider();

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
                  child: FutureBuilder(
                    future: _dbProvider.getTasks(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Task>> snapshot) {
                      return ScrollConfiguration(
                        behavior: NoGlowBehavior(),
                        child: ListView.builder(
                          itemCount:
                              snapshot.data == null ? 0 : snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return TaskCardWidget(
                              title: snapshot.data![index].title,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 24,
              right: 0,
              child: GestureDetector(
                onTap: () async {
                  await Get.toNamed(Routes.TASK);
                  // print('back');
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
