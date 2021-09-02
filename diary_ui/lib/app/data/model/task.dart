class Task {
  String id = '';
  String? title = '';
  String? description = '';
  String? CourseId = '';
  String? TeacherId = '';
  String? StudentId = '';

  Task({
    this.id = '',
    this.title = '',
    this.description = '',
    this.CourseId = '',
    this.TeacherId = '',
    this.StudentId = '',
  });

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    CourseId = json['CourseId'];
    TeacherId = json['TeacherId'];
    StudentId = json['StudentId'];
  }

  Task.fromJsonMongo(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    CourseId = json['CourseId'];
    TeacherId = json['TeacherId'];
    StudentId = json['StudentId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['CourseId'] = CourseId;
    data['TeacherId'] = TeacherId;
    data['StudentId'] = StudentId;
    return data;
  }

  Map<String, dynamic> toJsonExceptId() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    if (CourseId != '') {
      data['CourseId'] = CourseId;
    }
    return data;
  }
}
