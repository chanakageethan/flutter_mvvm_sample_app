import 'package:flutter_mvvm_sample_app/data/services/api/models/product.dart';
import 'package:flutter_mvvm_sample_app/utils/result.dart';

abstract class ProductRepository {
  Future<Result<List<Product>>> getAllProducts();
}
