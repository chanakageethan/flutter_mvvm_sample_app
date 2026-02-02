import 'package:flutter/material.dart';
import 'package:flutter_mvvm_sample_app/ui/home/view_models/home_view_model.dart';
import 'package:go_router/go_router.dart';

import '../../routing/routes.dart';
import '../product/widgets/todo_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: _body());
  }

  Widget _body() => SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
              return ListView.builder(
                shrinkWrap: true,
                itemCount: widget.viewModel.products.length,

                itemBuilder: (context, index) {
                  return ProductListItem(
                    productItem: widget.viewModel.products[index],
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
