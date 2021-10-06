import 'package:diary_ui/app/modules/student_profile/widgets/gender.dart';
import 'package:diary_ui/app/modules/student_profile/widgets/input_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/student_profile_controller.dart';

class StudentProfileView extends GetView<StudentProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                      child: InkWell(
                        onTap: () => {
                          Get.back(),
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image(
                            image: AssetImage(
                              'assets/images/back_arrow_icon.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        // top: 60.0,
                        bottom: 40.0,
                        left: 80.0,
                        right: 80.0,
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        elevation: 5.0,
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                    top: 40.0, left: 70.0, bottom: 40.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Personal Information',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 20.0),
                                    InputField(label: 'Name', content: 'Name'),
                                    SizedBox(height: 20.0),
                                    Gender(),
                                    SizedBox(height: 20.0),
                                    InputField(
                                        label: 'Date of birth',
                                        content: '01/01/1990'),
                                    SizedBox(height: 20.0),
                                    InputField(
                                        label: 'Email',
                                        content: 'username@example.com'),
                                    SizedBox(height: 20.0),
                                    InputField(
                                        label: 'Mobile',
                                        content: '+8801711111111'),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: 40.0, left: 70.0, bottom: 40.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'Institutional Information',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 20.0),
                                    InputField(
                                      label: 'Institute',
                                      content: 'Khulna University',
                                    ),
                                    SizedBox(height: 20.0),
                                    InputField(
                                      label: 'Discipline',
                                      content: 'CSE',
                                    ),
                                    SizedBox(height: 20.0),
                                    InputField(
                                        label: 'Student Id', content: '180229'),
                                    SizedBox(height: 20.0),
                                    InputField(
                                      label: 'Year',
                                      content: '3rd',
                                    ),
                                    SizedBox(height: 20.0),
                                    InputField(
                                      label: 'Term',
                                      content: '1st',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
