import 'package:diary_ui/app/data/model/api_response.dart';
import 'package:diary_ui/app/data/model/teacher.dart';
import 'package:diary_ui/app/data/model/user_response.dart';
import 'package:diary_ui/app/data/provider/teacher_provider.dart';
import 'package:diary_ui/app/data/services/user/service.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TeacherService extends GetxService {
  static Future<APIResponse<UserResponse>> loginTeacher(Teacher teacher) async {
    var apiResponse = await TeacherProvider.loginTeacher(teacher);
    if (apiResponse.data != null) {
      UserService.token = apiResponse.data!.token;
      UserService.userType = 'teacher';
      UserService.userId = apiResponse.data!.teacherId;
    } else {
      UserService.token = '';
      UserService.userType = '';
      UserService.userId = '';
    }
    return apiResponse;
  }

  static Future<APIResponse<UserResponse>> registerTeacher(
      Teacher teacher) async {
    var apiResponse = await TeacherProvider.registerTeacher(teacher);
    if (apiResponse.data != null) {
      UserService.token = apiResponse.data!.token;
      UserService.userType = 'teacher';
      UserService.userId = apiResponse.data!.teacherId;
    } else {
      UserService.token = '';
      UserService.userType = '';
      UserService.userId = '';
    }
    return apiResponse;
  }

  static Future<APIResponse<bool>> updateTeacher(Teacher teacher) async {
    return await TeacherProvider.updateTeacher(teacher);
  }

  static Future<APIResponse<bool>> deleteTeacher(String id) async {
    return await TeacherProvider.deleteTeacher(id);
  }
}
