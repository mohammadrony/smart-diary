class Student {
  String id = '';
  String email = '';
  String stdId = '';
  String name = '';
  String imageUrl = '';
  String DepartmentId = '';

  Student({
    this.id = '',
    this.email = '',
    this.stdId = '',
    this.name = '',
    this.imageUrl = '',
    this.DepartmentId = '',
  });

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    stdId = json['stdId'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    DepartmentId = json['DepartmentId'];
  }

  Student.fromJsonMongo(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
    stdId = json['stdId'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    DepartmentId = json['DepartmentId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['stdId'] = stdId;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['DepartmentId'] = DepartmentId;
    return data;
  }

  Map<String, dynamic> toJsonExceptId() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['stdId'] = stdId;
    data['name'] = name;
    data['DepartmentId'] = DepartmentId;
    return data;
  }
}
