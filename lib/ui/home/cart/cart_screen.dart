import 'package:flutter/material.dart';

import '../view_models/cart_view_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, required this.viewModel});

  final CartViewModel viewModel;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white, body: _body()),
    );
  }

  Widget _body() => Column(children: []);
}
