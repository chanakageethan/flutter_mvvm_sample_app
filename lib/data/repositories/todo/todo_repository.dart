import 'package:flutter_mvvm_sample_app/data/services/api/models/todo.dart';
import 'package:flutter_mvvm_sample_app/utils/result.dart';

abstract class TodoRepository {
  Future<Result<List<Todo>>> getAllTodos();
}
