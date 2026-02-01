import 'package:flutter/material.dart';

class TodoDetailsScreen extends StatelessWidget {
  const TodoDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        body: _body());
  }

  Widget _body() => SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ListenableBuilder(
          //   listenable: widget.viewModel,
          //   builder: (context, child) {
          //     if (widget.viewModel.load.running) {
          //       return const Center(child: CircularProgressIndicator());
          //     }
          //     if (widget.viewModel.load.error) {
          //       return Center(child: Text("Error! Try again!"));
          //     }
          //     return ListView.builder(
          //       shrinkWrap: true,
          //       itemCount: widget.viewModel.todos.length,
          //
          //       itemBuilder: (context, index) {
          //         return ListTile(
          //           title: Text(
          //             widget.viewModel.todos[index].title.toString(),
          //             style: TextStyle(
          //               fontSize: 16,
          //               fontWeight: FontWeight.w500,
          //             ),
          //           ),
          //         );
          //       },
          //     );
          //   },
          // ),
        ],
      ),
    ),
  );
}
