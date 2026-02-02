import 'package:flutter/material.dart';
import 'package:flutter_mvvm_sample_app/ui/home/view_models/home_view_model.dart';
import 'package:go_router/go_router.dart';

import '../../routing/routes.dart';
import 'widgets/list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white, body: _body()),
    );
  }

  Widget _body() => SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Discover Products",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 16),
          ListenableBuilder(
            listenable: widget.viewModel,
            builder: (context, child) {
              if (widget.viewModel.load.running) {
                return const Center(child: CircularProgressIndicator());
              }
              if (widget.viewModel.load.error) {
                return Center(child: Text("Error! Try again!"));
              }

              return GridView.builder(
                shrinkWrap: true,
                itemCount: widget.viewModel.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (_, int index) {
                  return InkWell(
                    onTap: () {},
                    child: ListItem(
                      productItem: widget.viewModel.products[index],
                    ),
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
