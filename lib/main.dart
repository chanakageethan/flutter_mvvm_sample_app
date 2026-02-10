import 'package:flutter/material.dart';
import 'package:flutter_mvvm_sample_app/data/repositories/cart/cart_repository.dart';
import 'package:flutter_mvvm_sample_app/data/repositories/cart/cart_repository_remote.dart';
import 'package:flutter_mvvm_sample_app/data/services/api/api_client.dart';
import 'package:flutter_mvvm_sample_app/data/services/api/cart_service.dart';
import 'package:flutter_mvvm_sample_app/data/services/api/product_service.dart';
import 'package:flutter_mvvm_sample_app/routing/router.dart';
import 'package:provider/provider.dart';

import 'data/repositories/product/product_repository.dart';
import 'data/repositories/product/product_repository_remote.dart';
import 'data/services/api/dio_client.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<ApiClient>(create: (_) => DioClient()),
        Provider<ProductRepository>(
          create: (context) => ProductRepositoryRemote(
            productService: ProductService(context.read<ApiClient>()),
          ),
        ),
        Provider<CartRepository>(
          create: (context) => CartRepositoryRemote(
            cartService: CartService(context.read<ApiClient>()),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      routerConfig: router(),
    );
  }
}
