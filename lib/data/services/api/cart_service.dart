import 'dart:io';

import '../../../utils/result.dart';
import 'api_client.dart';

class CartService {
  final ApiClient _apiClient;

  CartService(this._apiClient);

  Future<Result<void>> addToCart({
    required int id,
    required int userId,
    required String productId,
    int quantity = 1,
  }) async {
    try {
      final body = {
        "id": id,
        "userId": userId,
        "products": [
          {"productId": productId, "quantity": quantity},
        ],
      };

      final response = await _apiClient.post("/carts", data: body);

      if (response.code == 200 || response.code == 201) {
        return Result.ok(null);
      } else {
        return Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}
