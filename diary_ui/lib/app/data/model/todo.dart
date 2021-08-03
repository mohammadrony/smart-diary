class Todo {
  String id = '';
  String title = '';
  int isDone = 0;
  String description = '';
  String dueDate = 'Due Date';
  String TaskId = '';
  Todo({
    this.id = '',
    this.title = '',
    this.description = '',
    this.dueDate = 'Due Date',
    this.isDone = 0,
    this.TaskId = '',
  });

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isDone = json['isDone'];
    description = json['description'];
    dueDate = json['dueDate'];
    TaskId = json['TaskId'];
  }

  Todo.fromJsonMongo(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    isDone = json['isDone'];
    description = json['description'];
    dueDate = json['dueDate'];
    TaskId = json['TaskId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['isDone'] = isDone;
    data['description'] = description;
    data['dueDate'] = dueDate;
    data['TaskId'] = TaskId;
    return data;
  }

  Map<String, dynamic> toJsonExceptId() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['isDone'] = isDone;
    data['description'] = description;
    data['dueDate'] = dueDate;
    data['TaskId'] = TaskId;
    return data;
  }
}
