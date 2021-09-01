class Teacher {
  String id = '';
  String email = '';
  String phoneNo = '';
  String name = '';
  String password = '';
  String imageUrl = '';
  String DepartmentId = '';

  Teacher({
    this.id = '',
    this.email = '',
    this.phoneNo = '',
    this.name = '',
    this.password = '',
    this.imageUrl = '',
    this.DepartmentId = '',
  });

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phoneNo = json['phoneNo'];
    name = json['name'];
    password = json['password'];
    imageUrl = json['imageUrl'];
    DepartmentId = json['DepartmentId'];
  }

  Teacher.fromJsonMongo(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
    phoneNo = json['phoneNo'];
    name = json['name'];
    password = json['password'];
    imageUrl = json['imageUrl'];
    DepartmentId = json['DepartmentId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['phoneNo'] = phoneNo;
    data['name'] = name;
    data['password'] = password;
    data['imageUrl'] = imageUrl;
    data['DepartmentId'] = DepartmentId;
    return data;
  }

  Map<String, dynamic> toJsonExceptId() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['phoneNo'] = phoneNo;
    data['name'] = name;
    data['password'] = password;
    data['imageUrl'] = imageUrl;
    data['DepartmentId'] = DepartmentId;
    return data;
  }
}
