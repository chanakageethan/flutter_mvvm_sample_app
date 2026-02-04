import 'package:flutter/material.dart';
import 'package:flutter_mvvm_sample_app/data/repositories/product/product_repository.dart';
import 'package:flutter_mvvm_sample_app/utils/result.dart';

import '../../../data/services/api/models/product.dart';
import '../../../utils/command.dart';

class ProductDetailsViewModel extends ChangeNotifier {
  ProductDetailsViewModel({
    required ProductRepository productRepository,
    required String productId,
  }) : _productRepository = productRepository,
       _productId = productId {
    load = Command0(_loadProduct)..execute();
  }

  final ProductRepository _productRepository;
  late final Command0 load;

  final String _productId;

  Product? _product;

  Product? get product => _product;

  Future<Result<void>> _loadProduct() async {
    final result = await _productRepository.getProduct(_productId);

    switch (result) {
      case Ok():
        _product = result.value;
        debugPrint('Product (${_product?.title}) loaded');
      case Error():
        debugPrint('Failed to load Product${result.error}');
    }

    notifyListeners();
    return result;
  }
}
