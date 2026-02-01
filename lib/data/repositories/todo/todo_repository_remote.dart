import 'package:flutter_mvvm_sample_app/data/repositories/todo/todo_repository.dart';
import 'package:flutter_mvvm_sample_app/data/services/api/models/todo.dart';
import 'package:flutter_mvvm_sample_app/utils/result.dart';

import '../../services/api/todo_service.dart';

class TodoRepositoryRemote implements TodoRepository {
  TodoRepositoryRemote({required TodoService todoService})
    : _todoService = todoService;

  final TodoService _todoService;
  List<Todo>? _cachedData;

  @override
  Future<Result<List<Todo>>> getAllTodos() async {
    if (_cachedData == null) {
      final result = await _todoService.getAllTodos();
      if (result is Ok<List<Todo>>) {
        _cachedData = result.value;
      }
      return result;
    } else {
      return Result.ok(_cachedData!);
    }
  }
}
