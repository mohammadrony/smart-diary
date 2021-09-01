class UserResponse {
  String token = '';
  String teacherId = '';
  String studentId = '';

  UserResponse({this.token = '', this.teacherId = '', this.studentId = ''});

  UserResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    teacherId = json['teacherId'];
    studentId = json['studentId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    data['teacherId'] = teacherId;
    data['studentId'] = studentId;
    return data;
  }
}
