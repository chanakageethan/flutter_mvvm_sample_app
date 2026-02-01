import 'package:flutter/material.dart';
import 'package:flutter_mvvm_sample_app/data/repositories/todo/todo_repository.dart';
import 'package:flutter_mvvm_sample_app/utils/result.dart';


import '../../../data/services/api/models/todo.dart';
import '../../../utils/command.dart';

class TodosViewModel extends ChangeNotifier {
  TodosViewModel({required TodoRepository todoRepository})
    : _todoRepository = todoRepository {
    load = Command0(_loadTodos)..execute();
  }

  final TodoRepository _todoRepository;
  late final Command0 load;

  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  Future<Result<void>> _loadTodos() async {
    final result = await _todoRepository.getAllTodos();

    switch (result) {
      case Ok():
        _todos = result.value;
        debugPrint('Continents (${_todos.length}) loaded');
      case Error():
        debugPrint('Failed to load Todos${result.error}');
    }

    notifyListeners();
    return result;
  }
}
