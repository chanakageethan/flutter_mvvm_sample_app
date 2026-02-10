import 'package:flutter_mvvm_sample_app/data/repositories/cart/cart_repository.dart';
import 'package:flutter_mvvm_sample_app/data/services/api/models/product.dart';

import '../../services/api/cart_service.dart';

class CartRepositoryRemote implements CartRepository {
  CartRepositoryRemote({required CartService cartService})
    : _cartService = cartService;

  final CartService _cartService;

  @override
  Future<void> addToCart({
    required int id,
    required int userId,
    required String productId,
    int quantity = 1,
  }) async {
    final result = await _cartService.addToCart(
      id: id,
      userId: userId,
      productId: productId,
    );


  }
}
