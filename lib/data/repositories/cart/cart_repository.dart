

import 'package:flutter_mvvm_sample_app/data/services/api/models/product.dart';

abstract class CartRepository {
  Future<void> addToCart({
    required int id,
    required int userId,
    required String productId,
    int quantity = 1,
  });
}