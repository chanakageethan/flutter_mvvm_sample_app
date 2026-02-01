import 'dart:convert';
import 'dart:io';

import 'package:flutter_mvvm_sample_app/data/services/api/models/todo.dart';
import 'package:flutter_mvvm_sample_app/utils/result.dart';

import 'api_client.dart';

class TodoService {
  final ApiClient _apiClient;

  TodoService(this._apiClient);

  Future<Result<List<Todo>>> getAllTodos() async {
    try {
      var response = await _apiClient.get("/todos");
      if (response.code == 200) {
        final json = jsonDecode(response.body);
        return Result.ok(
          json.map((element) => Todo.fromJson(element)).toList(),
        );
      } else {
        return Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}
