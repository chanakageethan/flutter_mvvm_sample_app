import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_sample_app/ui/home/view_models/product_details_view_model.dart';

import '../../core/ui/widgets/common_app_bar.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.productId,
    required this.viewModel,
  });

  final String productId;
  final ProductDetailsViewModel viewModel;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CommonAppBar(title: "Product Details"),
        body: _body(),
      ),
    );
  }

  Widget _body() => ListenableBuilder(
    listenable: widget.viewModel.load,
    builder: (context, child) {
      if (widget.viewModel.load.running) {
        return const Center(child: CircularProgressIndicator());
      }
      if (widget.viewModel.load.error) {
        return Center(child: Text("Error! Try again!"));
      }

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CachedNetworkImage(
                maxHeightDiskCache: 300,
                imageUrl: widget.viewModel.product?.image ?? "",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),

              SizedBox(height: 32),
              Text(
                widget.viewModel.product?.title ?? "",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 16),
              Text(
                widget.viewModel.product?.description ?? "",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 16),
              Text(
                "${widget.viewModel.product?.price} LKR" ?? "",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      );
    },
  );
}
