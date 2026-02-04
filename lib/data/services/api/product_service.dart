import 'dart:convert';
import 'dart:io';

import 'package:flutter_mvvm_sample_app/utils/result.dart';

import 'api_client.dart';
import 'models/product.dart';

class ProductService {
  final ApiClient _apiClient;

  ProductService(this._apiClient);

  Future<Result<List<Product>>> getAllProducts() async {
    try {
      var response = await _apiClient.get("/products");
      if (response.code == 200) {
        final decoded = jsonDecode(response.body as String);

        final products = (decoded as List)
            .map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList();

        return Result.ok(products);
      } else {
        return Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  Future<Result<Product>> getProduct(String productId) async {
    try {
      var response = await _apiClient.get("/products/$productId");
      if (response.code == 200) {
        final decoded = jsonDecode(response.body as String);

        final product = Product.fromJson(decoded);

        return Result.ok(product);
      } else {
        return Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}
