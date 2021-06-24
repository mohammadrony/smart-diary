class Todo {
  String? text;
  bool? done;

  Todo({this.text, this.done});

  Todo.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['done'] = done;
    return data;
  }
}
