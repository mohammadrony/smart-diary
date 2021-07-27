class Todo {
  String id = '';
  String title = '';
  int isDone = 0;
  String TaskId = '';
  Todo({this.id = '', this.title = '', this.isDone = 0, this.TaskId = ''});

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
