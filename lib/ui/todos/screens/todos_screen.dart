import 'package:flutter/material.dart';
import 'package:flutter_mvvm_sample_app/ui/todos/view_models/todos_view_model.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key, required this.viewModel});

  final TodosViewModel viewModel;

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  Widget _body() => SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
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
              // return Center(child: Text(widget.viewModel.todos[0].title.toString()));
              return ListView.builder(
                shrinkWrap: true,
                itemCount: widget.viewModel.todos.length,

                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widget.viewModel.todos[index].title.toString()),
                  );
                },
              );
            },
          ),
        ],
      ),
    ),
  );
}
