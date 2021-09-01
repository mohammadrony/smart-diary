import 'package:diary_ui/app/data/model/api_response.dart';
import 'package:diary_ui/app/data/model/student.dart';
import 'package:diary_ui/app/data/model/user_token.dart';
import 'package:diary_ui/app/data/provider/student_provider.dart';
import 'package:diary_ui/app/data/services/user/service.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class StudentService extends GetxService {
  static Future<APIResponse<UserToken>> loginStudent(Student student) async {
    var apiResponse = await StudentProvider.loginStudent(student);
    UserService.userToken = apiResponse.data ?? UserToken();
    return apiResponse;
  }

  static Future<APIResponse<UserToken>> registerStudent(Student student) async {
    var apiResponse = await StudentProvider.registerStudent(student);
    UserService.userToken = apiResponse.data ?? UserToken();
    return apiResponse;
  }

  static Future<APIResponse<bool>> updateStudent(Student student) async {
    return await StudentProvider.updateStudent(student);
  }

  static Future<APIResponse<bool>> deleteStudent(String id) async {
    return await StudentProvider.deleteStudent(id);
  }
}
