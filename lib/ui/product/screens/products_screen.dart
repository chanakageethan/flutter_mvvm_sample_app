import 'package:flutter/material.dart';
import 'package:flutter_mvvm_sample_app/ui/product/view_models/product_view_model.dart';

import '../widgets/todo_list_item.dart';

class  ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key, required this.viewModel});

  final ProductViewModel viewModel;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
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
