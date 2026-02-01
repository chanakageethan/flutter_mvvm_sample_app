import 'package:flutter/material.dart';
import 'package:flutter_mvvm_sample_app/ui/todos/view_models/todos_view_model.dart';

class TodosScreen extends StatefulWidget {
  final TodosViewModel viewModel;

  const TodosScreen({super.key, required this.viewModel});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  Widget _body() => Column(
    children: [
      ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, child) {
          if (widget.viewModel.load.running) {
            return const Center(child: CircularProgressIndicator());
          }
          if (widget.viewModel.load.error) {
            return Center(child: Text("Error! Try again!"));
          }
          return child!;
        },
      ),
    ],
  );
}
