import 'package:flutter/material.dart';
import 'package:flutter_mvvm_sample_app/data/repositories/product/product_repository.dart';
import 'package:flutter_mvvm_sample_app/utils/result.dart';

import '../../../data/services/api/models/product.dart';
import '../../../utils/command.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required ProductRepository productRepository})
    : _productRepository = productRepository {
    load = Command0(_loadProducts)..execute();
  }

  final ProductRepository _productRepository;
  late final Command0 load;

  List<Product> _products = [];

  List<Product> get products => _products;

  Future<Result<void>> _loadProducts() async {
    final result = await _productRepository.getAllProducts();

    switch (result) {
      case Ok():
        _products = result.value;
        debugPrint('Products (${_products.length}) loaded');
      case Error():
        debugPrint('Failed to load Products${result.error}');
    }

    notifyListeners();
    return result;
  }
}
