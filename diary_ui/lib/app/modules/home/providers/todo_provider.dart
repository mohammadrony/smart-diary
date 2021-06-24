import 'package:get/get.dart';

import '../todo_model.dart';

class TodoProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Todo.fromJson(map);
      if (map is List) return map.map((item) => Todo.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Todo?> getTodo(int id) async {
    final response = await get('todo/$id');
    return response.body;
  }

  Future<Response<Todo>> postTodo(Todo todo) async => await post('todo', todo);
  Future<Response> deleteTodo(int id) async => await delete('todo/$id');
}
