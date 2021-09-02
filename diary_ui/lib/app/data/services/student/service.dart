import 'package:diary_ui/app/data/model/api_response.dart';
import 'package:diary_ui/app/data/model/student.dart';
import 'package:diary_ui/app/data/model/user_response.dart';
import 'package:diary_ui/app/data/provider/student_provider.dart';
import 'package:diary_ui/app/data/services/user/service.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class StudentService extends GetxService {
  static Future<APIResponse<UserResponse>> loginStudent(Student student) async {
    var apiResponse = await StudentProvider.loginStudent(student);
    if (apiResponse.data != null) {
      UserService.token = apiResponse.data!.token;
      UserService.userType = 'student';
      UserService.userId = apiResponse.data!.studentId ?? '';
    } else {
      UserService.token = '';
      UserService.userType = '';
      UserService.userId = '';
    }
    return apiResponse;
  }

  static Future<APIResponse<UserResponse>> registerStudent(
      Student student) async {
    var apiResponse = await StudentProvider.registerStudent(student);
    if (apiResponse.data != null) {
      UserService.token = apiResponse.data!.token;
      UserService.userType = 'student';
      UserService.userId = apiResponse.data!.studentId ?? '';
    } else {
      UserService.token = '';
      UserService.userType = '';
      UserService.userId = '';
    }
    return apiResponse;
  }

  static Future<APIResponse<bool>> updateStudent(Student student) async {
    return await StudentProvider.updateStudent(student);
  }

  static Future<APIResponse<bool>> deleteStudent(String id) async {
    return await StudentProvider.deleteStudent(id);
  }
}
