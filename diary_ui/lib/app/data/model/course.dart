class Course {
  String id = '';
  String? courseCode = '';
  String? title = '';
  String? session = '';
  String? credit = '';
  String? DepartmentId = '';

  Course({
    this.id = '',
    this.courseCode = '',
    this.title = '',
    this.session = '',
    this.credit = '',
    this.DepartmentId = '',
  });

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseCode = json['courseCode'];
    title = json['title'];
    session = json['session'];
    credit = json['credit'];
    DepartmentId = json['DepartmentId'];
  }

  Course.fromJsonMongo(Map<String, dynamic> json) {
    id = json['_id'];
    courseCode = json['courseCode'];
    title = json['title'];
    session = json['session'];
    credit = json['credit'];
    DepartmentId = json['DepartmentId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['courseCode'] = courseCode;
    data['title'] = title;
    data['session'] = session;
    data['credit'] = credit;
    data['DepartmentId'] = DepartmentId;
    return data;
  }

  Map<String, dynamic> toJsonExceptId() {
    final data = <String, dynamic>{};
    data['courseCode'] = courseCode;
    data['title'] = title;
    data['session'] = session;
    data['credit'] = credit;
    data['DepartmentId'] = DepartmentId;
    return data;
  }
}
