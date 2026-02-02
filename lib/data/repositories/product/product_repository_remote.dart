import 'package:flutter_mvvm_sample_app/data/repositories/product/product_repository.dart';

import 'package:flutter_mvvm_sample_app/utils/result.dart';

import '../../services/api/models/product.dart';
import '../../services/api/product_service.dart';

class ProductRepositoryRemote implements ProductRepository {
  ProductRepositoryRemote({required ProductService productService})
    : _productService = productService;

  final ProductService _productService;
  List<Product>? _cachedData;

  @override
  Future<Result<List<Product>>> getAllProducts() async {
    if (_cachedData == null) {
      final result = await _productService.getAllProducts();
      if (result is Ok<List<Product>>) {
        _cachedData = result.value;
      }
      return result;
    } else {
      return Result.ok(_cachedData!);
    }
  }
}
