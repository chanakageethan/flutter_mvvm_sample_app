import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_sample_app/data/repositories/cart/cart_repository.dart';

class CartViewModel extends ChangeNotifier {
  CartViewModel({
    required CartRepository cartRepository
  })
    : _cartRepository = cartRepository;

  final CartRepository _cartRepository;
}
