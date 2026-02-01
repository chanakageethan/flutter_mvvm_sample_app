import 'package:flutter/material.dart';
import 'package:flutter_mvvm_sample_app/data/repositories/todo/todo_repository.dart';
import 'package:flutter_mvvm_sample_app/data/repositories/todo/todo_repository_remote.dart';
import 'package:flutter_mvvm_sample_app/data/services/api/api_client.dart';
import 'package:flutter_mvvm_sample_app/data/services/api/todo_service.dart';
import 'package:flutter_mvvm_sample_app/routing/router.dart';
import 'package:flutter_mvvm_sample_app/ui/home/home_screen.dart';
import 'package:provider/provider.dart';

import 'data/services/api/dio_client.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [




        Provider<ApiClient>(create: (_) => DioClient()),


        Provider<TodoRepository>(
          create: (context) => TodoRepositoryRemote(
            todoService: TodoService(context.read<ApiClient>()),
          ),
        ),



      ],
      child:
      MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      routerConfig: router(),
    );
  }
}
