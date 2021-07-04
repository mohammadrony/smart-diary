class Todo {
  int? id;
  String? title;
  int? isDone;
  int? TaskId;
  Todo({this.id, this.title, this.isDone, this.TaskId});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isDone = json['isDone'];
    TaskId = json['TaskId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['isDone'] = isDone;
    data['TaskId'] = TaskId;
    return data;
  }
}
